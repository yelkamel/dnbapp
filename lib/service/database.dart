import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dnbapp/model/badge_model.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:get/get.dart';

class Database {
  final FirebaseFirestore service = FirebaseFirestore.instance;

  Future<bool> saveUser(UserModel user) async {
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

  Future<DocumentReference> addPost(PostModel post) async {
    try {
      return await service.collection("post").add(post.toJson());
    } catch (e) {
      Get.snackbar("Database Oupsi !", e);
      rethrow;
    }
  }

  Stream<List<UserModel>> allUserStream() {
    return service.collection("user").snapshots().map((QuerySnapshot query) {
      List<UserModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(UserModel.fromJson({...element.data(), "id": element.id}));
      });
      return retVal;
    });
  }

  Stream<List<PostModel>> userPostStream(String uid) => service
          .collection("post")
          .orderBy("createdDate", descending: true)
          .where("uid", isEqualTo: uid)
          .snapshots()
          .map((QuerySnapshot query) {
        List<PostModel> retVal = [];
        query.docs.forEach((element) {
          retVal.add(PostModel.fromJson({...element.data(), "id": element.id}));
        });
        return retVal;
      });

  Future<List<PostModel>> getUserSaved(List<String> postIds) async {
    if (postIds.isEmpty) return [];

    try {
      Query query = FirebaseFirestore.instance.collection("post");
      query
          .orderBy("createdDate", descending: true)
          .where("id", arrayContainsAny: postIds);

      final QuerySnapshot queryDoc = await query.get();
      final List<PostModel> listItems = queryDoc.docs
          .map((snapshot) => PostModel.fromJson(snapshot.data()))
          .toList();
      return listItems;
    } catch (e) {
      Get.snackbar("Database Oupsi !", e);
      rethrow;
    }
  }

  Stream<List<PostModel>> userSavedStream(List<String> postIds) => service
          .collection("post")
          .orderBy("createdDate", descending: true)
          .where("id", arrayContainsAny: postIds)
          .snapshots()
          .map((QuerySnapshot query) {
        List<PostModel> retVal = [];
        query.docs.forEach((element) {
          print('===> ${element.data}');
          retVal.add(PostModel.fromJson({...element.data(), "id": element.id}));
        });
        return retVal;
      });

  Stream<List<PostModel>> postStream() {
    return service
        .collection("post")
        .orderBy("createdDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<PostModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(PostModel.fromJson({...element.data(), "id": element.id}));
      });
      return retVal;
    });
  }

  Stream<List<BadgeModel>> badgeStream() {
    return service.collection("badge").snapshots().map((QuerySnapshot query) {
      List<BadgeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(BadgeModel.fromJson({...element.data(), "id": element.id}));
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
