import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  NextButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AllColors().nextButtonBackgroundColor,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          'Next',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: AllColors().whiteColor,
          ),
        ),
      ),
    );
  }
}
