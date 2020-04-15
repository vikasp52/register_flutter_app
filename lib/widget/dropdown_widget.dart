import 'package:flutter/material.dart';
import 'package:registerflutterapp/utils/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final ValueChanged onChanged;
  final String value;

  CustomDropdown({this.label, this.options, this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    Widget _buildIndustryList() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AllColors().whiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                label,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: AllColors().labelColor),
              ),
            ),
            DropdownButtonHideUnderline(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: TextStyle(
                    color: AllColors().blackColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  hint: Text(
                    "- Choose option -",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AllColors().blackColor),
                  ),
                  value: value,
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20.0, color: AllColors().blackColor),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return _buildIndustryList();
  }
}
