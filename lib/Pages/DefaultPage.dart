import 'package:flutter/material.dart';

import '../GenericStyles.dart';

class DefaultPage extends StatelessWidget with GenericStyles {
  final String pageTitle;
  final Widget childWidget;
  final Function floatingActionButtonHandler;
  final List<Widget> appBarWidgets;

  DefaultPage(
      {this.pageTitle,
      @required this.childWidget,
      this.floatingActionButtonHandler,
      this.appBarWidgets = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget myAppBar = (pageTitle != null)
        ? AppBar(
            title: Text(
              pageTitle,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: DarkButtonTheme.textStyle.color),
            ),
            actions: appBarWidgets,
          )
        : null;

    Widget myFloatingActionButton = (floatingActionButtonHandler != null)
        ? FloatingActionButton(
            child: Icon(
              Icons.add,
            ),
            onPressed: floatingActionButtonHandler)
        : null;

    FloatingActionButtonLocation myFABLocation =
        (floatingActionButtonHandler != null)
            ? FloatingActionButtonLocation.centerFloat
            : null;

    return Scaffold(
      appBar: myAppBar,
      body: childWidget,
      floatingActionButton: myFloatingActionButton,
      floatingActionButtonLocation: myFABLocation,
    );
  }
}
