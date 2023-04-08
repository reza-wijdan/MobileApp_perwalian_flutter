import 'package:flutter/material.dart';

class SelectedOption extends StatefulWidget {
  @override
  _SelectOptionState createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectedOption> {
  final List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (value) => {
        print(value)
      },
      items: options.map((e) => DropdownMenuItem(child: Text(e))).toList()
    );
  }
}
