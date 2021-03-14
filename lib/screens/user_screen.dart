import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/remote_datasource/user_api_client.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  FutureBuilder<List<UserModel>> _buildBody(BuildContext context) {
    final client = UserApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<UserModel>>(

      future: client.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<UserModel> users = snapshot.data;
          return _buildUsers(context, users);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildUsers(BuildContext context, List<UserModel> users) {
    return ListView.builder(
      itemCount: users.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              users[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: [
                Text(users[index].company.name),
              ],
            ),
          ),
        );
      },
    );
  }
}
