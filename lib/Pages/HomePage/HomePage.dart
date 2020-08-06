import 'package:provider/provider.dart';
import '../../Providers/WorkFlowData.dart';

import 'package:flutter/material.dart';

import '../DefaultPage.dart';
import './WorkFlowList.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    WorkFlowData dataProvider =
        Provider.of<WorkFlowData>(context, listen: false);

    dataProvider.fetchPendingWorkflows();

    return DefaultPage(
      pageTitle: "Pending Workflows",
      childWidget: Container(
        color: Colors.blue[200],
        child: WorkFlowList(),
      ),
    );
  }
}
