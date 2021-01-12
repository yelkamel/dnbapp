import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';

List<PostModel> list = [
  PostModel(name: "test1", id: "rere", createdDate: DateTime.now()),
  PostModel(name: "test2", id: "rére", createdDate: DateTime.now()),
  PostModel(name: "test3", id: "rdffdere", createdDate: DateTime.now()),
  PostModel(name: "test4", id: "redfdre", createdDate: DateTime.now()),
  PostModel(name: "test5", id: "rerdfdfe", createdDate: DateTime.now()),
  PostModel(name: "test6", id: "rerdfe", createdDate: DateTime.now()),
  PostModel(name: "test7", id: "redfdfre", createdDate: DateTime.now()),
  PostModel(name: "test8", id: "rerdfdfe", createdDate: DateTime.now()),
];

class ProfilPost extends StatelessWidget {
  const ProfilPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var post in list)
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ListTile(leading: Text(post.id), title: Text(post.name)))
        ],
      ),
    );
  }
}
