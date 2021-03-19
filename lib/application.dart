import 'package:flutter/material.dart';
import 'package:test_app/screens/splash_screen.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.cyan,
      ),

      home: SplashScreen(),
    );
  }
}
