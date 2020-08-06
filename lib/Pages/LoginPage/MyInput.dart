import 'package:flutter/material.dart';

import '../../GenericStyles.dart';

class MyInput extends StatelessWidget with GenericStyles {
  final String label;
  final bool passwordType;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final Function onSaved;
  final Function validator;

  MyInput(
      {@required this.label,
      this.passwordType,
      @required this.focusNode,
      @required this.onFieldSubmitted,
      @required this.onSaved,
      @required this.validator});

  @override
  Widget build(BuildContext context) {
    TextStyle generalStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: getInputBorderStyle(Colors.black, 1),
          focusedBorder: getInputBorderStyle(Colors.deepPurple, 3),
          labelStyle: generalStyle,
          hintStyle: generalStyle,
        ),
        obscureText: (passwordType != null) ? passwordType : false,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
