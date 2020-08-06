import 'dart:math';

import 'package:flutter/material.dart';

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

  ThemeData get getThemeData {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.blue),
    );
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
