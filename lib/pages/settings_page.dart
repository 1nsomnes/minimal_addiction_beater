import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                "Dark Mode",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (val) => {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme()
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
