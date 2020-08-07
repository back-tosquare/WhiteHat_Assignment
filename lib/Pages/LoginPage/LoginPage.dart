import 'package:provider/provider.dart';
import '../../Providers/WorkFlowData.dart';

import 'package:flutter/material.dart';

import '../DefaultPage.dart';
import './MyInput.dart';
import './LoginButton.dart';
import './LoginUtility.dart';
import '../HomePage/HomePage.dart';
import '../../GenericStyles.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginUtility {
  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map<String, String> formValue = {"username": "", "password": ""};

  void dispose() {
    userNameFocus.dispose();
    passwordFocus.dispose();

    super.dispose();
  }

  void formSubmitHandler(WorkFlowData dataProvider, BuildContext context) {
    bool validateStatus = formKey.currentState.validate();
    if (validateStatus) {
      formKey.currentState.save();
      dataProvider.startProgressIndicator();
      dataProvider
          .login(
        username: formValue["username"],
        password: formValue["password"],
      )
          .then((value) {
        if (value == null) {
          showDialogHandler(context, "Invalid Login Credentials !");
        } else {
          navigateToPageHandler(
            context: context,
            route: HomePage.routeName,
          );
        }
      }).catchError((error) {
        debugPrint("Error *** (Caught @ Login Page )$error");
        dataProvider.stopProgressIndicator();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WorkFlowData dataProvider =
        Provider.of<WorkFlowData>(context, listen: false);

    return DefaultPage(
      childWidget: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/background1.jpg'),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Container(
                height: 320,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        MyInput(
                          label: "User Name",
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(passwordFocus);
                          },
                          focusNode: userNameFocus,
                          onSaved: (value) {
                            formValue["username"] = value;
                          },
                          validator: (String value) {
                            return (value.isEmpty) ? "Enter User Name" : null;
                          },
                        ),
                        MyInput(
                          label: "Password",
                          passwordType: true,
                          onFieldSubmitted: (_) {},
                          focusNode: passwordFocus,
                          initialValue: "@2W0mb@t",
                          onSaved: (value) {
                            formValue["password"] = value;
                          },
                          validator: (String value) {
                            return (value.isEmpty) ? "Enter Password" : null;
                          },
                        ),
                        LoginButton(
                            color: DarkButtonTheme.color,
                            text: "Login",
                            onPressed: () {
                              formSubmitHandler(dataProvider, context);
                            }),
                      ]),
                )),
          ],
        ),
      ),
    );
  }
}
