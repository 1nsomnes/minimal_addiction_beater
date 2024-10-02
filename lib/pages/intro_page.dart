import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  Future<void> _navigateToHome(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isIntroSeen', true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Icon(Icons.search, size: 100)),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Welcome to Addiction Beater! We're so glad you joined us, enter an addiction you would like to beat to begin:",
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: "Addiction..."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: TextButton(
              onPressed: () {
                _navigateToHome(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 18), // Padding inside the button
              ),
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 18, // Text size
                        fontFamily: "Arial"),
                  ),
                  SizedBox(width: 8), // Space between text and icon
                  Icon(
                    Icons.arrow_forward, // Arrow icon
                    color: Colors.white, // Icon color
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
