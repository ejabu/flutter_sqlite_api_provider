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

    final payload = "Some Payload # 1";

    this.data = payload;
    this.stage = Stage.DONE;

    notifyListeners();
    refreshDataOne();
  }

  void refreshDataOne() async {
    await Future.delayed(Duration(seconds: 1));

    final payload = "Some Payload # 2";

    this.data = payload;

    notifyListeners();
    refreshDataTwo();
  }

  void refreshDataTwo() async {
    await Future.delayed(Duration(seconds: 1));

    final payload = "Some Payload # 3";

    this.data = payload;

    notifyListeners();
    refreshDataThree();
  }

  void refreshDataThree() async {
    await Future.delayed(Duration(seconds: 1));

    final payload = "Some Payload # 4";

    this.data = payload;

    notifyListeners();
  }
}
