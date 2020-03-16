import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String textTitle;
  BottomButton({@required this.onTap, @required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(textTitle,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        color: kBottomCardColour,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
