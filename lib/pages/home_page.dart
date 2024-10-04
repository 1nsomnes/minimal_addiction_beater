import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:minimal_addiciton_beater/components/heatmap.dart';
import 'package:minimal_addiciton_beater/components/home/home_drawer.dart';
import 'package:minimal_addiciton_beater/components/popups/get_input_dialog.dart';
import 'package:minimal_addiciton_beater/pages/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<AddictionDatabase>(context).currentIndex;
    Addiction current =
        Provider.of<AddictionDatabase>(context).currentAddictions[currentIndex];
    DateTime mostRecentRelapse = current.dates[current.dates.length - 1];

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
      drawer: const HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const MyInputDialog(
                    title: "Enter an Addiction",
                    placeholder: "Addiction...",
                  ));
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child:
                      Text(current.name, style: const TextStyle(fontSize: 22)),
                ),
              ],
            ),
            SizedBox(
              height: 325,
              child: PageView(
                controller: _controller,
                children: const [MyHeatMap(), Text("Page 2"), Text("Page 3")],
              ),
            ),
            // TODO: make it match the color scheme?
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                dotWidth: 13,
                dotHeight: 13,
              ),
            ),
            Text("Start Date: ${current.startDate}"),
            Text(
                "First Started: ${DateTime.now().difference(current.startDate).inDays} days ago"),
            Text(
                "Last Relapse: ${DateTime.now().difference(mostRecentRelapse).inDays} days ago"),
          ],
        ),
      ),
    );
  }
}
