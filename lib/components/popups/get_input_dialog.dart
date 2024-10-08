import 'package:flutter/material.dart';

class MyInputDialog extends StatelessWidget {
  const MyInputDialog({
    super.key,
    required this.title,
    required this.placeholder,
    required this.submit,
  });

  final String title;
  final String placeholder;
  final Future<bool> Function(String) submit;

  @override
  Widget build(BuildContext context) {
    String text = "";

    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 16,
        title: Text(title),
        content: TextField(
          onChanged: (value) => text = value,
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
            onPressed: () async {
              if (await submit(text)) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('OK'),
          ),
        ]);
  }
}
