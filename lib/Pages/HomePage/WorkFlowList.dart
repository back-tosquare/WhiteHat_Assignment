import 'package:provider/provider.dart';
import '../../Providers/WorkFlowData.dart';

import 'package:flutter/material.dart';

import '../../Providers/Models/WorkFlow.dart';
import './ListItem.dart';

class WorkFlowList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WorkFlowData dataProvider = Provider.of<WorkFlowData>(context);

    List<WorkFlow> items = dataProvider.items;

    return (items.length == 0)
        ? Center(child: CircularProgressIndicator())
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
