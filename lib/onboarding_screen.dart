import 'package:flutter/material.dart';
import 'package:mr_match/gradient_button.dart';
import 'package:mr_match/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'image': 'assets/images/onboarding_1.png',
      'title': 'Welcome to Mr Match',
      'description': 'Connect with other singles and find your perfect match.',
    },
    {
      'image': 'assets/images/onboarding_2.png',
      'title': 'Discover Matches',
      'description': 'Browse through profiles and start connecting with potential partners.',
    },
    {
      'image': 'assets/images/onboarding_3.png',
      'title': 'Engage in Conversations',
      'description': 'Chat with your matches and get to know them better.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  void _navigateToLoginScreen() {
    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      // Log the error and display a generic error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while navigating to the login screen.'),
        ),
      );
      print('Error while navigating to login screen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              final data = _onboardingData[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        data['image'],
                        width: 300,
                        height: 300,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      data['title'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      data['description'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          if (_currentPage == _onboardingData.length - 1)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: GradientButton(
                onPressed: _navigateToLoginScreen,
                text: 'Get Started',
              ),
            ),
        ],
      ),
    );
  }
}
