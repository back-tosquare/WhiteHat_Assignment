import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final String text;
  final Function(bool) onChecked;
  MyCheckBox({@required this.text, this.onChecked});
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Text(
            widget.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(width: 10),
          Transform.scale(
            scale: 1.25,
            child: Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                  debugPrint("$_isSwitched");
                  widget.onChecked(value);
                });
              },
              activeTrackColor: Colors.blue[200],
              activeColor: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
