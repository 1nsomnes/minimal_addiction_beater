import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:minimal_addiciton_beater/pages/initialization_screen.dart';
import 'package:minimal_addiciton_beater/theme/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> initializeApp(BuildContext context) async {
  await AddictionDatabase.initialize();
  await Provider.of<AddictionDatabase>(context).fetchAddictions();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AddictionDatabase.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AddictionDatabase()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: const InitializationScreen()));
}
