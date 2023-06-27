import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String name;
  final int sks;

  const CustomCheckbox({required this.name, required this.sks});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1,
                  color: _isChecked ? Color(0xFF0F7187) : Color(0xFFAFAFAF))),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    child: _isChecked
                        ? Image.asset('assets/images/chekced.png')
                        : Image.asset('assets/images/uncheked.png'),
                  ),
                ),
                Flexible(
                    flex: 7,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${widget.name}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                Text(
                    "${widget.sks} SKS",
                    style:const TextStyle(color: Color(0xFFAFAFAF)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
