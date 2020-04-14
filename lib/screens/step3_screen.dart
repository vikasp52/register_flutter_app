import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';
import 'package:registerflutterapp/widget/next_button_widget.dart';

class Screen3 extends StatelessWidget {
  final VoidCallback onPressed;

  Screen3({this.onPressed});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 25.0,
        ),
        Text(
          'Personal Information',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: AllColors().whiteColor,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Please fill the information below and your goal for digital saving',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: AllColors().whiteColor,
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        NextButton(
          onPressed: this.onPressed,
        ),
      ],
    );
  }
}
