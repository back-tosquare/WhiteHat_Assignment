import 'package:flutter/material.dart';

import './AddNewItem/AddNewItem.dart';

mixin HomePageUtility {
  void showBottomModalHandler(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return AddNewItem(
            parentBuildContext: context,
          );
        });
  }

  void closeBottomModalHandler(BuildContext context) {
    Navigator.of(context).pop();
  }
}
