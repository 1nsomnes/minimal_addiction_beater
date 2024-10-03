import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyInputDialog extends StatelessWidget {
  const MyInputDialog({
    super.key,
    required this.title,
    required this.placeholder,
  });

  final String title;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 16,
        title: Text(title),
        content: TextField(
          decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(
                color: Colors.grey[500],
              )),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              debugPrint("Ok pressed");
            },
            child: const Text('OK'),
          ),
        ]);
  }
}
