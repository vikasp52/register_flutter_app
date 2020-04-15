import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';
import 'package:registerflutterapp/widget/next_button_widget.dart';

class Screen2 extends StatefulWidget {
  final VoidCallback onPressed;

  Screen2({this.onPressed});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool isLowerCase = false;
  bool isUpperCase = false;
  bool isContainNumber = false;
  bool isValidLength = false;

  String checkComplexity() {
    if (isLowerCase && !isUpperCase && !isContainNumber && !isValidLength) {
      return 'Very Weak';
    } else if (isLowerCase && isUpperCase && !isContainNumber && !isValidLength) {
      return 'Weak';
    }else if (isLowerCase && isUpperCase && isContainNumber && !isValidLength) {
      return 'Medium';
    }else if (isLowerCase && isUpperCase && isContainNumber && isValidLength) {
      return 'Strong';
    }
    return '';
  }

  String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value) && !isValidLength)
      return 'Enter Valid Email';
    else
      return null;
  }

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
            SizedBox(
              height: 10.0,
            ),
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
        TextFormField(
          obscureText: true,
          validator: validatePassword,
          onChanged: (val) {
            //Condition for Upper case
            if (val.contains(RegExp(r'^(?=.*?[A-Z])'))) {
              setState(() {
                isUpperCase = true;
              });
            } else {
              setState(() {
                isUpperCase = false;
              });
            }

            //Condition for Lower case
            if (val.contains(RegExp(r'^(?=.*?[a-z])'))) {
              setState(() {
                isLowerCase = true;
              });
            } else {
              setState(() {
                isLowerCase = false;
              });
            }

            //Condition for contain number
            if (val.contains(RegExp(r'^(?=.*?[0-9])'))) {
              setState(() {
                isContainNumber = true;
              });
            } else {
              setState(() {
                isContainNumber = false;
              });
            }

            //Condition for length
            if (val.length > 9) {
              setState(() {
                isValidLength = true;
              });
            } else {
              setState(() {
                isValidLength = false;
              });
            }
          },
          decoration: InputDecoration(
            filled: true,
            hintText: 'Create Password',
            fillColor: Colors.white,
            focusColor: Colors.grey,
            errorStyle: TextStyle(
              color: AllColors().whiteColor,
            ),
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
        RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: 'Complexity: ',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              color: AllColors().whiteColor,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: checkComplexity(),
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: AllColors().orangeColor,)),
            ],
          ),
        ),

        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            columnBody(value: 'a', label: 'Lowercase', valid: isLowerCase),
            columnBody(value: 'A', label: 'Uppercase', valid: isUpperCase),
            columnBody(value: '123', label: 'Number', valid: isContainNumber),
            columnBody(value: '9+', label: 'Characters', valid: isValidLength),
          ],
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
