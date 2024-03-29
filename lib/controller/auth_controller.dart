import 'package:dnbapp/controller/post_controller.dart';
import 'package:dnbapp/controller/radio_controller.dart';
import 'package:dnbapp/dialog/email_login.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool loading = false.obs;
  Rx<User> _firebaseUser = Rx<User>();
  User get user => _firebaseUser.value;
  RxBool isSignUp = false.obs;

  @override
  onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());

    ever<User>(_firebaseUser, (_) {
      if (_.uid != null) {
        Get.put<UserController>(UserController(_.uid), permanent: true);
        Get.put<RadioController>(RadioController(), permanent: true);
        Get.put<PostController>(PostController(), permanent: true);
      }
    });
  }

  Future<void> createOrGetUser(UserCredential userCredential) async {
    loading.value = true;

    final userFirestore = await Database().getUserById(userCredential.user.uid);
    print("===> Get User Firestore $userFirestore");
    Get.put<UserController>(UserController(userCredential.user.uid),
        permanent: true);

    if (userFirestore == null) {
      isSignUp.value = true;
      UserModel _user = UserModel(
        id: userCredential.user.uid,
        name: userCredential.user.displayName,
        email: userCredential.user.email,
        status: 'registration',
      );
      print("===> User To Create $_user");
      await Database().saveUser(_user);
      loading.value = false;
      return _user;
    }
    loading.value = false;
    return userFirestore;
  }

  Future<bool> fbLogin() async {
    try {
      loading.value = true;

      // by default the login method has the next permissions ['email','public_profile']
      AccessToken accessToken = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
      final credential = FacebookAuthProvider.credential(accessToken.token);

      final userCredential = await _auth.signInWithCredential(credential);
      await createOrGetUser(userCredential);
      return true;
    } on FacebookAuthException catch (e) {
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          Get.snackbar(
              'Oups', "You have a previous login operation in progress");
          break;
        case FacebookAuthErrorCode.CANCELLED:
          Get.snackbar('Oups', "login cancelled");
          break;
        case FacebookAuthErrorCode.FAILED:
          Get.snackbar('Oups', "login failed");
          break;
      }
      return false;
    } finally {
      loading.value = false;
    }
  }

  Future<bool> isSignUpUser(String email) async {
    final array = await _auth.fetchSignInMethodsForEmail(email);
    return array.isEmpty;
  }

  Future<void> logByEmailAndPassword() async {
    try {
      loading.value = true;
      final Map<String, String> emailPAssword =
          await Get.dialog(EmailLoginDialog());

      final isSignUp = await isSignUpUser(emailPAssword["email"]);
      UserCredential userCredential;
      if (isSignUp) {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: emailPAssword["email"], password: emailPAssword["password"]);
      } else {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: emailPAssword["email"], password: emailPAssword["password"]);
      }

      await createOrGetUser(userCredential);
      loading.value = false;
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOut() async {
    try {
      await FacebookAuth.instance.logOut();
      await _auth.signOut();
      Get.offAllNamed('/');

      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
