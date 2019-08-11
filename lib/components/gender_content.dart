import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderContent extends StatelessWidget {
  GenderContent({this.gendericon, this.genderlabel});
  final IconData gendericon;
  final String genderlabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          gendericon,
          size: 50,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          genderlabel,
          style: klabelStyle,
        )
      ],
    );
  }
}
