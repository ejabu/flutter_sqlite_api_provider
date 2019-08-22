import 'package:flutter/material.dart';

enum Stage { PROGRESS, DONE, ERROR }

class ScreenProvider with ChangeNotifier {
  String data;
  Stage stage;

  ScreenProvider() {
    stage = Stage.PROGRESS;
    initData();
  }

  void initData() async {
    await Future.delayed(Duration(seconds: 1));

    final payload = "Some Payload From Rest API";

    this.data = payload;
    this.stage = Stage.DONE;

    notifyListeners();
  }
}
