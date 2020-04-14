import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';
import 'package:registerflutterapp/widget/next_button_widget.dart';

class Screen1 extends StatelessWidget {
  final VoidCallback onPressed;

  Screen1({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(
                  text: 'Welcome to \nGNI ',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: AllColors().blackColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Finans',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AllColors().finansTextColor)),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome to The Bank of The Future.\nManage and track your accounts on\nthe go.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: AllColors().blackColor,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email, color: AllColors().blackColor,),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 10.0),

                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),

        NextButton(
          onPressed: this.onPressed,
        ),
      ],
    );
  }
}
