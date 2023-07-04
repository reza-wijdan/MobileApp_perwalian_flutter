import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 200),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}