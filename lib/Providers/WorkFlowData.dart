import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import './GenericConfiguration.dart';
import './Models/WorkFlow.dart';
import '../GenericStyles.dart';

class WorkFlowData with ChangeNotifier, GenericConfiguration, GenericStyles {
  String token;
  bool progressIndicator = false;
  List<WorkFlow> _items = [];

  void startProgressIndicator() {
    progressIndicator = true;
    notifyListeners();
  }

  void stopProgressIndicator() {
    progressIndicator = false;
    notifyListeners();
  }

  Future<dynamic> login(
      {@required String username, @required String password}) {
    Map<String, String> authData = {"username": username, "password": password};

    return postHandler(
      url: "https://flowengine.herokuapp.com/rest-auth/login/",
      authData: authData,
    ).then((responseMap) {
      token = responseMap["key"];
      debugPrint(token);
      stopProgressIndicator();
      notifyListeners();

      return token;
    }).catchError(genericErrorHandler);
  }

  List<WorkFlow> get items {
    return (_items != null) ? [..._items] : [];
  }

  Future<void> fetchPendingWorkflows() {
    return getHandler(
            url: "https://flowengine.herokuapp.com/getPendingFlows/",
            token: token)
        .then((responseMap) {
      debugPrint("$token $responseMap");
      _items = [];
      responseMap.forEach((item) {
        _items.add(WorkFlow(
            id: item["id"],
            createdAt: item["created_at"],
            updatedAt: item["updated_at"],
            currentStage: item["stage"]["label"],
            completed: item["completed"],
            restricted: item["restricted"],
            flowName: item["flow_name"],
            image: randomImagePath));
      });
      notifyListeners();
    }).catchError(genericErrorHandler);
  }
}
