import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/general/gesture_text.dart';

class ManageCurrentAddictionPage extends StatelessWidget {
  const ManageCurrentAddictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Options:", style: TextStyle(fontSize: 20)),
          GestureText(
            text: "Edit",
            onTap: () {},
            fontSize: 16,
          ),
          GestureText(
            text: "Reset",
            onTap: () {},
            textColor: Colors.red,
            fontSize: 16,
          ),
          GestureText(
            text: "Delete",
            onTap: () {},
            textColor: Colors.red,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
