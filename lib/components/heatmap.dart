import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:minimal_addiciton_beater/components/database/addiction.dart';
import 'package:minimal_addiciton_beater/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({
    super.key,
    required this.currentAddiction,
  });

  final Addiction currentAddiction;

  Map<DateTime, int> getDates() {
    DateTime now = DateTime.now();
    DateTime currentDay = DateTime(now.year, now.month, now.day);

    var result = new Map<DateTime, int>();
    for (int i = 0; i < 40; i++) {
      if (currentDay.isBefore(currentAddiction.startDate)) {
        break;
      }
      bool dateExists = currentAddiction.dates.any((val) =>
          val.year == currentDay.year &&
          val.month == currentDay.month &&
          val.day == currentDay.day);
      if (!dateExists) {
        result[currentDay] = 1;
      }
      currentDay = currentDay.subtract(Duration(days: 1));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: getDates(),
      startDate: DateTime.now().add(const Duration(days: -40)),
      endDate: DateTime.now(),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      colorMode: ColorMode.opacity,
      defaultColor: Provider.of<ThemeProvider>(context).themeData.primaryColor,
      showColorTip: false,
      size: 30,
      showText: false,
      scrollable: true,
      colorsets: const {
        1: Colors.green,
      },
    );
  }
}
