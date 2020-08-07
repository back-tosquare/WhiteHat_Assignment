import 'package:provider/provider.dart';
import '../../Providers/WorkFlowData.dart';

import 'package:flutter/material.dart';

import '../../Providers/Models/WorkFlow.dart';
import './ListItem/ListItem.dart';

import '../../GenericStyles.dart';

class WorkFlowList extends StatelessWidget with GenericStyles {
  @override
  Widget build(BuildContext context) {
    WorkFlowData dataProvider = Provider.of<WorkFlowData>(context);

    List<WorkFlow> items = dataProvider.items;

    debugPrint("${items.length}");

    return (items.length == 0)
        ? Center(child: getCircularProgressBar())
        : ListView.builder(
            itemBuilder: (ctx, index) {
              WorkFlow currentItem = items[index];

              return ListItem(
                item: currentItem,
              );
            },
            itemCount: dataProvider.items.length,
          );
  }
}
