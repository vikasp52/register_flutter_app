import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';
import 'package:registerflutterapp/widget/next_button_widget.dart';

class Screen2 extends StatelessWidget {
  final VoidCallback onPressed;

  Screen2({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        NextButton(
          onPressed: this.onPressed,
        ),
      ],
    );
  }
}
