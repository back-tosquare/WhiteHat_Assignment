import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

import './GenericConfiguration.dart';
import './Models/WorkFlow.dart';
import '../GenericStyles.dart';

class WorkFlowData with ChangeNotifier, GenericConfiguration, GenericStyles {
  String _token;

  set _setToken(String value) {
    _token = value;
  }

  String get getToken {
    return _token;
  }

  void setPersistentStorageValue(String tokenValue) {
    SharedPreferences.getInstance().then((storage) {
      storage.setString("token", tokenValue);
    });
  }

  Future<void> getPersistentStorageValue() {
    if (getToken != null) {
      return Future(() {}).then((_) {});
    } else {
      return SharedPreferences.getInstance().then((storage) {
        _setToken = storage.getString("token");
      });
    }
  }

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

  WorkFlow getWorkFlowModel(Map<String, dynamic> item) {
    return WorkFlow(
      id: item["id"],
      createdAt: item["created_at"],
      updatedAt: item["updated_at"],
      currentStage: item["stage"]["label"],
      completed: item["completed"].toString(),
      restricted: item["restricted"].toString(),
      flowName: item["flow_name"],
      image: randomImagePath,
    );
  }

  Future<dynamic> login(
      {@required String username, @required String password}) {
    Map<String, String> authData = {"username": username, "password": password};

    return postHandler(
      url: "https://flowengine.herokuapp.com/rest-auth/login/",
      authData: authData,
    ).then((responseMap) {
      if (responseMap["key"] != null) {
        debugPrint(responseMap["key"]);
        _setToken = responseMap["key"];

        setPersistentStorageValue(getToken);

        stopProgressIndicator();
        notifyListeners();

        return getToken;
      } else {
        throw HttpException("Authentication Error");
      }
    }).catchError(genericErrorHandler);
  }

  List<WorkFlow> get items {
    return (_items != null) ? [..._items] : [];
  }

  Future<dynamic> createNewFlow(
      {@required String flowName, @required bool restrictedStatus}) {
    Map<String, String> authData = {
      "flow_name": flowName,
      "restricted": restrictedStatus.toString(),
      "parent_flow": "",
      "flow_type": ""
    };
    return getPersistentStorageValue().then((_) {
      return postHandler(
        url: "https://flowengine.herokuapp.com/createFlow/",
        authData: authData,
        token: getToken,
      );
    }).then((response) {
      if (response == null) {
        throw response;
      } else {
        _items.insert(0, getWorkFlowModel(response));
        notifyListeners();
      }
      return response;
    }).catchError(genericErrorHandler);
  }

  Future<void> fetchPendingWorkflows() {
    return getPersistentStorageValue().then((_) {
      getHandler(
              url: "https://flowengine.herokuapp.com/getPendingFlows/",
              token: getToken)
          .then((responseMap) {
        if (getToken != null) {
          debugPrint("$getToken $responseMap");
          _items = [];
          responseMap.forEach((item) {
            _items.add(getWorkFlowModel(item));
          });
          notifyListeners();
        } else {
          throw HttpException("Authentication Error");
        }
      });
    });
  }
}
