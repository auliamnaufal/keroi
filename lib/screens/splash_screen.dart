import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keroi/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(const Duration(seconds: 3),
        () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen()
        ),
      ));

    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: const Center(
        child: Text(
          "Keroi",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}