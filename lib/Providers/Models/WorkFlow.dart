import 'package:flutter/material.dart';

class WorkFlow {
  String id;
  String createdAt;
  String updatedAt;
  String currentStage;
  String completed;
  String restricted;
  String flowName;
  String image;

  WorkFlow(
      {@required this.id,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.currentStage,
      @required this.completed,
      @required this.restricted,
      @required this.flowName,
      @required this.image});
}
