import 'package:WHiteHat_Assignment/Pages/HomePage/SecondRow.dart';
import 'package:flutter/material.dart';

import '../../Providers/Models/WorkFlow.dart';
import '../../GenericStyles.dart';
import './FirstRow.dart';

class ListItem extends StatelessWidget with GenericStyles {
  final WorkFlow item;

  ListItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 60, top: 20, right: 10),
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: Offset(5.0, 10.0),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 50),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: FirstRow(
                            text: item.flowName,
                            icon: Icons.text_fields,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            iconSize: 48,
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: iconLightBackground,
                              size: 36,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                    SizedBox(height: 5),
                    SecondRow(
                      text: item.createdAt,
                      icon: Icons.outlined_flag,
                      iconColor: Colors.amber,
                    ),
                    SizedBox(height: 5),
                    SecondRow(
                      text: item.currentStage,
                      icon: (item.currentStage == "Created")
                          ? Icons.check_circle
                          : Icons.add_circle,
                      iconColor: (item.currentStage == "Created")
                          ? Colors.green
                          : Colors.red,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Positioned(
          left: 20,
          top: 40,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(item.image),
          ))
    ]);
  }
}
