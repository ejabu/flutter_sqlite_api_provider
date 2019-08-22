import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum Stage { PROGRESS, DONE, ERROR }

class ScreenProvider with ChangeNotifier {

  List<String> yearList = [];
  Stage stage;

  ScreenProvider() {
    stage = Stage.PROGRESS;
    initData();
  }

  void initData() async {
    final String url = 'https://api.jsonbin.io/b/5d5e160e4acbd77681dd46a0/2';
    final jsonPayload = await http.get(url);
    final payload = json.decode(jsonPayload.body) as Map<String, dynamic>;
    for (var element in payload['data']) {
      this.yearList.add(element as String);
    }

    this.stage = Stage.DONE;

    notifyListeners();
    refreshDataOne();
  }

  void refreshDataOne() async {
    final String url = 'https://api.jsonbin.io/b/5d5e160e4acbd77681dd46a0/2';
    final jsonPayload = await http.get(url);
    final payload = json.decode(jsonPayload.body) as Map<String, dynamic>;
    for (var element in payload['data']) {
      this.yearList.add(element as String);
    }
    
    notifyListeners();
    refreshDataTwo();
  }

  void refreshDataTwo() async {
    final String url = 'https://api.jsonbin.io/b/5d5e160e4acbd77681dd46a0/2';
    final jsonPayload = await http.get(url);
    final payload = json.decode(jsonPayload.body) as Map<String, dynamic>;
    for (var element in payload['data']) {
      this.yearList.add(element as String);
    }
    
    notifyListeners();
    refreshDataThree();
  }

  void refreshDataThree() async {
    final String url = 'https://api.jsonbin.io/b/5d5e160e4acbd77681dd46a0/2';
    final jsonPayload = await http.get(url);
    final payload = json.decode(jsonPayload.body) as Map<String, dynamic>;
    for (var element in payload['data']) {
      this.yearList.add(element as String);
    }
    
    notifyListeners();
  }

}
