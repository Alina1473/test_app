import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Icon(
            Icons.home,
            size: MediaQuery.of(context).size.width * 0.785,
          ),
        ),
      ),
    );
  }
}
