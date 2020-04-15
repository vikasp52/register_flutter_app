import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';

class DateTimePicker extends StatelessWidget {
  final String label;
  final GestureTapCallback onTap;

  DateTimePicker({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget _buildIndustryList() {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AllColors().whiteColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  label,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: AllColors().labelColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      label,
                      style: TextStyle(
                        color: AllColors().blackColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AllColors().labelColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return _buildIndustryList();
  }
}
