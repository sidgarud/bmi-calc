import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonStyle,
          ),
        ),
        color: kbottomContainerColour,
        height: kbottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 15),
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
