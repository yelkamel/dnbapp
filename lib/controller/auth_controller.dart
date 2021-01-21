import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User> _firebaseUser = Rx<User>();
  User get user => _firebaseUser.value;

  @override
  onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> createOrGetUser(UserCredential userCredential,
      {String pp}) async {
    final userFirestore = await Database().getUserById(userCredential.user.uid);
    print("===> Get User Firestore $userFirestore");
    if (userFirestore == null) {
      Get.toNamed("/onboarding");
      UserModel _user = UserModel(
        id: userCredential.user.uid,
        name: userCredential.user.displayName,
        email: userCredential.user.email,
        pp: pp,
      );
      print("===> User To Create $_user");
      await Database().createNewUser(_user);
      return _user;
    }
    return userFirestore;
  }

  Future<bool> fbLogin() async {
    try {
      // by default the login method has the next permissions ['email','public_profile']
      AccessToken accessToken = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
      final credential = FacebookAuthProvider.credential(accessToken.token);

      final userCredential = await _auth.signInWithCredential(credential);
      await createOrGetUser(
        userCredential,
        pp: userData["picture"]["data"]["url"].toString(),
      );
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
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
      await FacebookAuth.instance.logOut();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
