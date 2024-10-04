import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:minimal_addiciton_beater/pages/home_page.dart';
import 'package:minimal_addiciton_beater/pages/intro_page.dart';
import 'package:minimal_addiciton_beater/theme/theme_provider.dart';
import 'package:minimal_addiciton_beater/utilities/app_scroll_behavior.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AddictionDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddictionDatabase()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
    await Provider.of<AddictionDatabase>(context, listen: false)
        .clearDatabase();
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
      home: _isIntroShown ? HomePage() : const IntroPage(),
      scrollBehavior: AppScrollBehavior(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
