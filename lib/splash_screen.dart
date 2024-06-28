import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mr_match/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  void _navigateToHomeScreen() {
    Timer(const Duration(seconds: 3), () {
      // Navigate to the home screen after the splash screen delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Mr Match Home Page')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 200, height: 200),
              
            ],
          ),
        ),
      ),
    );
  }
}
