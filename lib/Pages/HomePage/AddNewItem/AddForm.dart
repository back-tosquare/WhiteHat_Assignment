import 'package:provider/provider.dart';
import '../../../Providers/WorkFlowData.dart';

import 'package:flutter/material.dart';

import '../../LoginPage/MyInput.dart';
import '../../DefaultWidgets/MyCheckBox.dart';
import '../../DefaultWidgets/MyButton.dart';

import '../../../GenericStyles.dart';
import '../HomePageUtility.dart';
import '../../LoginPage/LoginUtility.dart';

class AddForm extends StatefulWidget {
  final BuildContext parentBuildContext;

  AddForm({@required this.parentBuildContext});

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm>
    with GenericStyles, HomePageUtility, LoginUtility {
  final FocusNode _newFlowInput = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, Object> _formValue = {
    "flow_name": "",
    "restricted": false,
  };

  void dispose() {
    _newFlowInput.dispose();

    super.dispose();
  }

  bool validateHandler() {
    return _formKey.currentState.validate();
  }

  void submitHandler(BuildContext context, WorkFlowData dataProvider) {
    _formKey.currentState.save();
    debugPrint("${_formValue}");

    dataProvider
        .createNewFlow(
      flowName: _formValue["flow_name"],
      restrictedStatus: _formValue["restricted"],
    )
        .then((response) {
      debugPrint("Then -> ${response}");
      closeBottomModalHandler(context);

      if (response == null) {
        showDialogHandler(context, "Authentication Error");
      }
    }).catchError((error) {
      // Post Key Error.
      debugPrint("Error -> ${error}");

      closeBottomModalHandler(context);
      showDialogHandler(context, "${error}");
    });
  }

  @override
  Widget build(BuildContext context) {
    WorkFlowData dataProvider =
        Provider.of<WorkFlowData>(context, listen: false);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
            child: MyInput(
              label: "Enter New Flow",
              focusNode: _newFlowInput,
              onFieldSubmitted: (_) {},
              onSaved: (value) {
                _formValue["flow_name"] = value;
              },
              validator: (value) {
                return (value.isEmpty) ? "Enter Flow Name" : null;
              },
            ),
          ),
          MyCheckBox(
            text: "Restricted",
            onChecked: (bool value) {
              _formValue["restricted"] = value;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  width: 150,
                  child: MyButton(
                    submitHandler: () {
                      submitHandler(context, dataProvider);
                    },
                    validateHandler: () {
                      return validateHandler();
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
