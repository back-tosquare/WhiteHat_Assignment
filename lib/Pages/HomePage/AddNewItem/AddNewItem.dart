import 'package:flutter/material.dart';

import '../../../GenericStyles.dart';
import './AddForm.dart';

class AddNewItem extends StatelessWidget with GenericStyles {
  final BuildContext parentBuildContext;

  AddNewItem({@required this.parentBuildContext});
  @override
  Widget build(BuildContext context) {
    double bottomKeyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    debugPrint("${bottomKeyboardHeight}");

    return Padding(
      padding: EdgeInsets.only(bottom: bottomKeyboardHeight),
      child: Container(
        height: 280,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).appBarTheme.color,
            width: 10,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: AddForm(parentBuildContext: parentBuildContext),
        ),
      ),
    );
  }
}
