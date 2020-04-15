import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';
import 'package:registerflutterapp/widget/date_time_picker.dart';
import 'package:registerflutterapp/widget/next_button_widget.dart';
import 'package:intl/intl.dart';

class Screen4 extends StatefulWidget {
  final VoidCallback onPressed;

  Screen4({this.onPressed});

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  String _value = '- Choose Date -';

  @override
  Widget build(BuildContext context) {
    Future _selectDate() async {
      var formatter = DateFormat('dd MMMM yyyy');

      DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2016),
          lastDate: DateTime(2022)
      );
      if(picked != null) setState((){
        String formatted = formatter.format(picked);
        _value = formatted;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 35.0,
              backgroundColor: Color(0xff77a9f9),
              child: CircleAvatar(
                backgroundColor: AllColors().whiteColor,
                child: Icon(
                  Icons.date_range,
                  color: AllColors().stepperBackgroundColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Schedule Video Call',
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
          'Choose a date and time that you preferred. we will send a link via email to make a video call on the scheduled date and time.',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: AllColors().whiteColor,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        DateTimePicker(
          label: _value,
          onTap: ()=> _selectDate(),
        ),
        SizedBox(
          height: 20.0,
        ),
        DateTimePicker(
          label: 'Time',
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
