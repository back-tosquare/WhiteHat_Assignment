import 'package:provider/provider.dart';
import './Providers/WorkFlowData.dart';
import './Providers/HomePageHandlers.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './GenericStyles.dart';

import './Pages/HomePage/HomePage.dart';
import './Pages/LoginPage/LoginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget with GenericStyles {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: WorkFlowData()),
        ChangeNotifierProvider.value(value: HomePageHandlers()),
      ],
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
