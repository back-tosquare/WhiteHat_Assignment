import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  final String pageTitle;
  final Widget childWidget;

  DefaultPage({this.pageTitle, @required this.childWidget});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget myAppBar =
        (pageTitle != null) ? AppBar(title: Text(pageTitle)) : null;

    return Scaffold(
      appBar: myAppBar,
      body: childWidget,
    );
  }
}
