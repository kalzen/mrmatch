import 'package:flutter/material.dart';
import 'package:mr_match/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Handle login button press
                  // Add error handling and logging as needed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Mr Match Home Page')),
                  );
                },
                child: const Text('Log In'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle get started button press
                  // Add error handling and logging as needed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Mr Match Home Page')),
                  );
                },
                child: const Text('Get Started'),
              ),
              const SizedBox(height: 16),
              const Text('Sign up and get Started'),
            ],
          ),
        ),
      ),
    );
  }
}
