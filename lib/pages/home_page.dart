import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<String>> _fetchDrawerItems() async {
    return ['Item 1', 'Item 2', 'Item 3'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("addiction beater"),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    )
                  },
              icon: const Icon(Icons.settings)),
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
