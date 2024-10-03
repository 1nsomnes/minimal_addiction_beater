import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/settings/settings_switch.dart';
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
        body: ListView(children: [
          MySettingsSwitch(
            name: "Dark Mode",
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          MySettingsSwitch(
              name: "Hide Addiction", value: false, onChanged: (val) {})
        ]));
  }
}
