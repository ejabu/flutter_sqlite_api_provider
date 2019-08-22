import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen_provider.dart';

class AutoInitRestApiScreen extends StatelessWidget {
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
      return ListView(
        children: <Widget>[
          for (var item in screen.yearList) 
            ...[
            ListTile(title: Text("$item"), dense: true,),
            Divider(
              height: 2,
            )
          ],
        ],
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
        title: Text('Call Endpoint once'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
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
