import 'dart:async';

import 'package:flutter/material.dart';

import 'package:read_book/app/presentation/home_page.dart'; // Substitua com o caminho correto para a sua Página Inicial

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/escribo1.jpg',
              height: 150,
            ),
            // CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
/*
void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
*/