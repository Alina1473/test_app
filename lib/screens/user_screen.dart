import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/remote_datasource/user_api_client.dart';

class UserScreen extends StatelessWidget {
  int userId;

  UserScreen({this.userId});

  @override
  Widget build(BuildContext context) {
    final client =
        UserApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<UserModel>(
      future: client.getTask('${this.userId}'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final UserModel user = snapshot.data;
          return _buildUser(context, user);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildUser(BuildContext context, UserModel user) {
    final Color color = Colors.cyan;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
              color: color,
              elevation: 4,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      user.username,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'phone: ${user.phone}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'website: ${user.website}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(height: 15),
          Card(
            elevation: 10,
            shadowColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Company',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                    color: color,
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Name: ${user.company.name}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Catch phrase: ${user.company.catchPhrase}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'BS: ${user.company.bs}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Card(
            elevation: 10,
            shadowColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Address',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                    color: color,
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Street: ${user.address.street}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Suite: ${user.address.suite}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'City: ${user.address.city}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Zipcode: ${user.address.zipcode}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Geo',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 7),
                        Text(
                          'lat: ${user.address.geo.lat}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'lng: ${user.address.geo.lng}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
