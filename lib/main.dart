import 'package:provider/provider.dart';
import './Providers/WorkFlowData.dart';

import 'package:flutter/material.dart';

import './GenericStyles.dart';

import './Pages/HomePage/HomePage.dart';
import './Pages/LoginPage/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with GenericStyles {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkFlowData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Whitehat Workflow",
        theme: getThemeData,
        home: LoginPage(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
        },
      ),
    );
  }
}
