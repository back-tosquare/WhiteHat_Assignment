import 'package:flutter/material.dart';

import '../../../GenericStyles.dart';

class FirstRow extends StatelessWidget with GenericStyles {
  FirstRow({
    @required this.text,
    @required this.icon,
    @required this.fontSize,
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
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        SizedBox(width: spacing),
        Container(
          width: width,
          child: Text(
            text,
            style: myTextStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        )
      ],
    );
  }
}
