import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class LinearProgressBarPage extends StatefulWidget {
  const LinearProgressBarPage({super.key});

  @override
  State<LinearProgressBarPage> createState() => _LinearProgressBarPageState();
}

class _LinearProgressBarPageState extends State<LinearProgressBarPage> {
// Variables to store progress values for each indicator
  int yearsDiff = 0;
  int monthsDiff = 0;
  int daysDiff = 0;
  int hoursDiff = 0;
  int minutesDiff = 0;
  int secondsDiff = 0;

  late Timer _timer;

  late int currentIndex;
  late Addiction current;
  late DateTime mostRecentRelapse;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    currentIndex = Provider.of<AddictionDatabase>(context).currentIndex;
    current =
        Provider.of<AddictionDatabase>(context).currentAddictions[currentIndex];
    mostRecentRelapse = current.dates[current.dates.length - 1];

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        secondsDiff = (DateTime.now().second - mostRecentRelapse.second);
        minutesDiff = (DateTime.now().minute - mostRecentRelapse.minute);
        hoursDiff = (DateTime.now().hour - mostRecentRelapse.hour);
        daysDiff = (DateTime.now().day - mostRecentRelapse.day);
        monthsDiff = DateTime.now().month - mostRecentRelapse.month;
        yearsDiff = DateTime.now().year - mostRecentRelapse.year;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LinearPercentIndicator(
              center: Text("$yearsDiff years"),
              lineHeight: 25,
              percent: yearsDiff / (yearsDiff + 1),
            ),
            LinearPercentIndicator(
              center: Text("$monthsDiff months"),
              lineHeight: 25,
              percent: monthsDiff / 12,
            ),
            LinearPercentIndicator(
              center: Text("$daysDiff days"),
              lineHeight: 25,
              percent: daysDiff / 30,
            ),
            LinearPercentIndicator(
              center: Text("$hoursDiff hours"),
              lineHeight: 25,
              percent: hoursDiff / 24,
            ),
            LinearPercentIndicator(
              center: Text("$minutesDiff minutes"),
              lineHeight: 25,
              percent: minutesDiff / 60,
            ),
            LinearPercentIndicator(
              center: Text("$secondsDiff seconds"),
              lineHeight: 25,
              percent: secondsDiff / 60,
            ),
          ],
        ));
  }
}
