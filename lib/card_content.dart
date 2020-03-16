import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class Card_Content extends StatelessWidget {
  final IconData icons;
  final String label;
  Card_Content({@required this.icons, this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(icons, size: 80.0),
          SizedBox(height: 10.0),
          Text(
            label,
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
