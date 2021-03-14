import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/post_model.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/remote_datasource/post_api_client.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<List<PostModel>> _buildBody(BuildContext context) {
    final postClient =
        PostApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<PostModel>>(
      future: postClient.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<PostModel> posts = snapshot.data;
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            shadowColor: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      child: Text(
                        'UserId: ${posts[index].userId}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: (){
                        print('tap ${posts[index].userId}');
                      },
                    ),
                  ),
                  SizedBox(height: 6),
                  Divider(
                    height: 10,
                    thickness: 2,
                    color: Colors.pinkAccent,
                  ),
                  SizedBox(height: 6),
                  Text(
                    posts[index].title,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    posts[index].body,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
