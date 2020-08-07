import 'package:flutter/material.dart';

mixin LoginUtility {
  void showDialogHandler(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(text),
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
    Navigator.of(context).pushNamed(route);
  }
}
