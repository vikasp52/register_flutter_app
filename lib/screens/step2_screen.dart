import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';
import 'package:registerflutterapp/widget/next_button_widget.dart';

class Screen2 extends StatelessWidget {
  final VoidCallback onPressed;

  Screen2({this.onPressed});

  @override
  Widget build(BuildContext context) {
    Widget columnBody({
      String label,
      String value,
      bool valid = false,
    }) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            valid
                ? CircleAvatar(
                    backgroundColor: Colors.lightGreen,
                    child: Icon(
                      Icons.check,
                      color: AllColors().whiteColor,
                      size: 30.0,
                    ),
                  )
                : Text(
                    value,
                    style: TextStyle(
                      color: AllColors().whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
            SizedBox(height: 10.0,),
            Text(
              label,
              style: TextStyle(
                color: AllColors().whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 25.0,
        ),
        Text(
          'Create Password',
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
          'Password will be used to login to account',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: AllColors().whiteColor,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Create Password',
            fillColor: Colors.white,
            focusColor: Colors.grey,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey)),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.visibility,
                color: AllColors().stepperBackgroundColor,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Complexity:',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: AllColors().whiteColor,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            columnBody(value: 'a', label: 'Lowercase'),
            columnBody(value: 'A', label: 'Uppercase'),
            columnBody(value: '123', label: 'Number'),
            columnBody(value: '9+', label: 'Characters'),
          ],
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
