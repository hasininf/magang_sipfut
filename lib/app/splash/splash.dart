import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xffD0F8DB),
          body: Center(
            child: Image.asset(
              'assets/logo.png',
              width: 200,
            ),
          )),
    );
  }
}
