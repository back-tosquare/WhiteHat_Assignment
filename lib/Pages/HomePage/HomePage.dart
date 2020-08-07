import 'package:provider/provider.dart';
import '../../Providers/WorkFlowData.dart';
import '../../Providers/HomePageHandlers.dart';

import 'package:flutter/material.dart';

import '../DefaultPage.dart';
import './WorkFlowList.dart';
import './HomePageUtility.dart';

class HomePage extends StatelessWidget with HomePageUtility {
  static const routeName = '/home';

  void floatingButtonPressHandler(BuildContext context) {
    showBottomModalHandler(context);
  }

  @override
  Widget build(BuildContext context) {
    WorkFlowData dataProvider =
        Provider.of<WorkFlowData>(context, listen: false);

    debugPrint("Home Page ${dataProvider.getToken}");

    dataProvider.fetchPendingWorkflows().catchError((error) {});

    return DefaultPage(
      pageTitle: "Pending Workflows",
      childWidget: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: WorkFlowList(),
      ),
      floatingActionButtonHandler: () {
        floatingButtonPressHandler(context);
      },
      appBarWidgets: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            floatingButtonPressHandler(context);
          },
        )
      ],
    );
  }
}
