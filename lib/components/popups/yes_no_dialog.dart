import 'package:flutter/material.dart';

class MyYesNoDialog extends StatelessWidget {
  const MyYesNoDialog({
    super.key,
    required this.title,
    required this.description,
    required this.okPressed,
  });

  final String title;
  final String description;
  final Function okPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 16,
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              okPressed();
            },
            child: const Text('Continue'),
          ),
        ]);
  }
}
