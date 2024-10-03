import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:minimal_addiciton_beater/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key});
  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: {
        DateTime(2024, 9, 6): 3,
        DateTime(2024, 9, 7): 7,
        DateTime(2024, 9, 8): 10,
        DateTime(2024, 9, 9): 13,
        DateTime(2024, 9, 13): 6,
      },
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
