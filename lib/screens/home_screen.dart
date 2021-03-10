import 'package:flutter/material.dart';
import 'package:test_app/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatelessWidget {

  List<PostModel> _postList = new List<PostModel>();

  Future<List<PostModel>> fetchPost() async {
    final responsePost =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (responsePost.statusCode == 200) {
      List<dynamic> values = new List<dynamic>();
      values = json.decode(responsePost.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            _postList.add(PostModel.fromJson(map));
            debugPrint('userId-------${map['userId']}');
            debugPrint('id-------${map['id']}');
            debugPrint('title-------${map['title']}');
            debugPrint('body-------${map['body']}');
          }
        }
      }
      return _postList;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Load Posts',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          onPressed: () {
            debugPrint('Pressed load posts');
            fetchPost();
            debugPrint('Fetched posts');
          },
        ),
      ),
    );
  }
}
