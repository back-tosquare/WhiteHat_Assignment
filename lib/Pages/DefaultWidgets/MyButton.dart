import 'package:flutter/material.dart';

import '../../GenericStyles.dart';

class MyButton extends StatefulWidget {
  final Function submitHandler;
  final Function validateHandler;

  MyButton({@required this.submitHandler, @required this.validateHandler});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with GenericStyles {
  bool progressIndicator = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: DarkButtonTheme.color,
      disabledColor: DarkButtonTheme.color,
      onPressed: (!progressIndicator)
          ? () {
              bool validateStatus = widget.validateHandler();
              if (validateStatus) {
                setState(() {
                  progressIndicator = true;
                  widget.submitHandler();
                });
              }
            }
          : null,
      child: (!progressIndicator)
          ? Text("Create", style: DarkButtonTheme.textStyle)
          : SizedBox(
              height: 20,
              width: 20,
              child: getCircularProgressBar(),
            ),
      shape: getRoundedShapeAllCorners(10),
    );
  }
}
