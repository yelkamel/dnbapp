import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:get/get.dart';

class Database {
  final FirebaseFirestore service = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await service.collection("user").doc(user.id).set(user.toJson());
      return true;
    } catch (e) {
      Get.snackbar("Database Oupsi !", e);
      return false;
    }
  }

  Future<UserModel> getUserById(String uid) async {
    try {
      DocumentSnapshot _doc = await service.collection("user").doc(uid).get();
      if (_doc.data() == null) return null;
      return UserModel.fromJson(_doc.data());
    } catch (e) {
      Get.snackbar("Database Oupsi !", e);
      rethrow;
    }
  }

  Stream<UserModel> userStream(String uid) => service
      .collection('user')
      .doc(uid)
      .snapshots()
      .map((snap) => UserModel.fromJson(snap.data()));

  Future<void> addPost(String content, String uid) async {
    try {
      await service.collection("users").doc(uid).collection("todos").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      Get.snackbar("Database Oupsi !", e);
      rethrow;
    }
  }

  Stream<List<PostModel>> postStream(String uid) {
    return service
        .collection("user")
        .doc(uid)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<PostModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(PostModel.fromJson(element.data()));
      });
      return retVal;
    });
  }

  Future<void> updatePost(bool newValue, String uid, String todoId) async {
    try {
      service
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      Get.snackbar("Database Oupsi !", e);
      rethrow;
    }
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    try {
      await service.collection("user").doc(uid).update(data);
    } catch (e) {
      Get.snackbar("Database Oupsi !", e);
      rethrow;
    }
  }
}