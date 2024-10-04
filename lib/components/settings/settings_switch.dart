import 'package:flutter/cupertino.dart';

class MySettingsSwitch extends StatelessWidget {
  final String name;
  final bool value;
  final ValueChanged<bool> onChanged;

  const MySettingsSwitch({
    super.key,
    required this.name,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: (val) => {onChanged(val)},
          ),
        ],
      ),
    );
  }
}
