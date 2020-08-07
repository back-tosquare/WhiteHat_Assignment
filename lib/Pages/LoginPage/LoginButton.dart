import 'package:provider/provider.dart';
import '../../Providers/WorkFlowData.dart';

import 'package:flutter/material.dart';

import '../../GenericStyles.dart';

class LoginButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color color;

  LoginButton(
      {@required this.text, @required this.onPressed, @required this.color});

  @override
  _GeneralRaisedButtonState createState() => _GeneralRaisedButtonState();
}

class _GeneralRaisedButtonState extends State<LoginButton> with GenericStyles {
  @override
  Widget build(BuildContext context) {
    WorkFlowData dataProvider = Provider.of<WorkFlowData>(context);

    return Container(
      width: 200,
      height: 50,
      child: RaisedButton(
        elevation: 5,
        child: Container(
          child: ((!dataProvider.progressIndicator))
              ? Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: lightForeground,
                  ),
                )
              : getCircularProgressBar(),
        ),
        onPressed: () {
          widget.onPressed();
        },
        color: widget.color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: widget.color)),
      ),
    );
  }
}
