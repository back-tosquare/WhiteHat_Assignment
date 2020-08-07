import 'package:flutter/material.dart';

import '../../../GenericStyles.dart';
import './FirstRow.dart';

class SecondRow extends StatelessWidget with GenericStyles {
  SecondRow({
    @required this.text,
    @required this.icon,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.iconSize = 18,
    this.spacing = 10,
    this.iconColor = Colors.grey,
    @required this.width,
  });

  final String text;
  final IconData icon;
  final double fontSize;
  final FontWeight fontWeight;
  final double iconSize;
  final double spacing;
  final Color iconColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    TextStyle myTextStyle = TextStyle(
      color: lightForeground,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );

    return Row(
      children: [
        SizedBox(width: 5),
        FirstRow(
          text: text,
          icon: icon,
          iconColor: iconColor,
          fontSize: 12,
          iconSize: 18,
          spacing: 5,
          width: width,
        )
      ],
    );
  }
}
