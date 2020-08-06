import 'package:flutter/material.dart';

mixin LoginUtility {
  void showDialogHandler(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Invalid Login Credentials !"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Close"),
              )
            ],
          );
        });
  }

  void navigateToPageHandler(
      {@required BuildContext context, @required String route}) {
    Navigator.of(context).pushReplacementNamed(route);
  }
}
