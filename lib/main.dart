import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/pages/home_page.dart';
import 'package:minimal_addiciton_beater/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: IntroPage());
  }
}
