import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen_provider.dart';

class AutoInitChainingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScreenProvider>(
      builder: (_) {
        return ScreenProvider();
      },
      child: Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  Widget renderBody(BuildContext context) {
    final screen = Provider.of<ScreenProvider>(context);
    if (screen.stage == Stage.DONE) {
      return Center(
        child: Text(
          "${screen.data}",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<ScreenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Call Endpoint 4x'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              screen.initData();
            },
          )
        ],
      ),
      body: renderBody(context),
    );
  }
}
