import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';
import 'package:registerflutterapp/widget/dropdown_widget.dart';
import 'package:registerflutterapp/widget/next_button_widget.dart';

class Screen3 extends StatefulWidget {
  final VoidCallback onPressed;

  Screen3({this.onPressed});

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  String _selectedGoal;
  String _selectedIncome;
  String _selectedExpence;

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
          height: 20.0,
        ),
        CustomDropdown(
          label: 'Goal for activation',
          options: ['Finential Independent', 'Retirement', 'Home'],
          onChanged: (value){},
        ),
        SizedBox(
          height: 20.0,
        ),
        CustomDropdown(
          label: 'Monthely income',
          options: ['\$1000000', '\$100000', '\$10000'],
          onChanged: (value){},
        ),
        SizedBox(
          height: 20.0,
        ),
        CustomDropdown(
          label: 'Monthely expence',
          options: ['\$100', '\$1000', '\$10000'],
          onChanged: (value){},
        ),
        SizedBox(
          height: 50.0,
        ),
        NextButton(
          onPressed: this.widget.onPressed,
        ),
      ],
    );
  }
}
