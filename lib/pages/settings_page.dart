import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:minimal_addiciton_beater/components/popups/yes_no_dialog.dart';
import 'package:minimal_addiciton_beater/components/settings/settings_switch.dart';
import 'package:minimal_addiciton_beater/pages/intro_page.dart';
import 'package:minimal_addiciton_beater/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: ListView(children: [
          MySettingsSwitch(
            name: "Dark Mode",
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          MySettingsSwitch(
              name: "Hide Addiction", value: false, onChanged: (val) {}),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 120),
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return MyYesNoDialog(
                          title: "Are you sure you want to continue?",
                          description:
                              "All your personal data is stored on your phone, once you choose to delete it there is no going back.",
                          okPressed: () async {
                            await Provider.of<AddictionDatabase>(context,
                                    listen: false)
                                .clearDatabase();
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('isIntroSeen', false);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const IntroPage()));
                          });
                    });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 18), // Padding inside the button
              ),
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content
                children: [
                  Text(
                    'Delete Data',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 18, // Text size
                      fontFamily: "Arial",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
