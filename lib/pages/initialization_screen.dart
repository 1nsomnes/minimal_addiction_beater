import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:minimal_addiciton_beater/pages/home_page.dart';
import 'package:minimal_addiciton_beater/pages/intro_page.dart';
import 'package:minimal_addiciton_beater/theme/theme_provider.dart';
import 'package:minimal_addiciton_beater/utilities/app_scroll_behavior.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitializationScreen extends StatelessWidget {
  const InitializationScreen({super.key});

  Future<void> initializeApp(BuildContext context) async {
    await Provider.of<AddictionDatabase>(context, listen: false)
        .fetchAddictions();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool("darkMode") ?? false;

    if (isDarkMode !=
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode) {
      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeApp(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                    child: CircularProgressIndicator()), // Loading screen
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                body: Center(child: Text('Error: ${snapshot.error}')),
              ),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Provider.of<AddictionDatabase>(context)
                      .currentAddictions
                      .isNotEmpty
                  ? HomePage()
                  : const IntroPage(),
              scrollBehavior: AppScrollBehavior(),
              theme: Provider.of<ThemeProvider>(context).themeData,
            );
          }
        });
  }
}
