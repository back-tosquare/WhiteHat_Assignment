import 'dart:math';

import 'package:flutter/material.dart';

class DarkButtonTheme {
  static const TextStyle textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const Color color = Colors.black;
}

mixin GenericStyles {
  Color get lightForeground {
    return Colors.white;
  }

  Color get iconLightBackground {
    return Colors.grey;
  }

  InputBorder getInputBorderStyle(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  ShapeBorder getRoundedShapeAllCorners(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }

  ShapeBorder getRoundedShapeTopCorners(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    );
  }

  ShapeBorder getRoundedShapeBottomCorners(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
    );
  }

  Widget getCircularProgressBar() {
    return CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(DarkButtonTheme.textStyle.color),
    );
  }

  ThemeData get getThemeData {
    return ThemeData(
        primaryColor: Color(0xFF265d9c),
        primaryColorDark: Color(0xFF333366),
        accentColor: Colors.green,
        appBarTheme: AppBarTheme(color: Color(0xFF00336c)),
        secondaryHeaderColor: Colors.amber,
        iconTheme: IconThemeData(color: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF00336c),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          shape: getRoundedShapeTopCorners(25),
          backgroundColor: Colors.white,
          elevation: 10,
        ));
  }

  String get randomImagePath {
    List<String> paths = [
      'assets/1.jpg',
      'assets/2.jpg',
      'assets/3.jpg',
      'assets/4.jpg',
      'assets/5.jpg',
      'assets/6.jpg',
    ];

    return paths[Random().nextInt(5)];
  }
}
