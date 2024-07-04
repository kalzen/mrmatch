import 'package:flutter/material.dart';
import 'package:mr_match/gradient_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<String> profileImages = [
    'assets/images/profile1.jpg',
    'assets/images/profile2.jpg',
    'assets/images/profile3.jpg',
    'assets/images/profile4.jpg',
    'assets/images/profile5.jpg',
  ];
  int _currentIndex = 0;

  Future<void> _saveMatch(bool isMatch) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? sessionCookie = prefs.getString('session_cookie');
      if (sessionCookie != null) {
        // Save the match information to the server
        // Add your implementation here
        print('Saved match: $isMatch');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please log in to save matches.'),
          ),
        );
      }
    } catch (e) {
      // Log the error and display a generic error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while saving the match.'),
        ),
      );
      print('Error while saving match: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.velocity.pixelsPerSecond.dx > 0) {
                    // Swipe right, match
                    _saveMatch(true);
                  } else if (details.velocity.pixelsPerSecond.dx < 0) {
                    // Swipe left, no match
                    _saveMatch(false);
                  }
                  setState(() {
                    _currentIndex = (_currentIndex + 1) % profileImages.length;
                  });
                },
                child: Image.asset(
                  profileImages[_currentIndex],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientButton(
                  onPressed: () {
                    _saveMatch(false);
                    setState(() {
                      _currentIndex = (_currentIndex + 1) % profileImages.length;
                    });
                  },
                  text: 'Nope',
                  width: 150,
                ),
                const SizedBox(width: 16),
                GradientButton(
                  onPressed: () {
                    _saveMatch(true);
                    setState(() {
                      _currentIndex = (_currentIndex + 1) % profileImages.length;
                    });
                  },
                  text: 'Match',
                  width: 150,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
