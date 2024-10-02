import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/pages/home_page.dart';
import 'package:minimal_addiciton_beater/pages/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isIntroShown = false;

  @override
  void initState() {
    super.initState();
    _checkIntroStatus();
  }

  Future<void> _checkIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isIntroSeen', false);
    bool isIntroSeen = prefs.getBool('isIntroSeen') ?? false;

    setState(() {
      _isIntroShown = isIntroSeen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _isIntroShown ? const HomePage() : const IntroPage());
  }
}
