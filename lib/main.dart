import 'package:flutter/material.dart';

import 'c_screen/1_auto_init/auto_init_screen.dart';
import 'c_screen/2_auto_init_chaining/auto_init_screen.dart';
import 'd_screen/1_auto_init/auto_init_screen.dart';
import 'd_screen/2_auto_init_chaining/auto_init_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BaseScreen(),
    );
  }
}

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List, SQLite, RestAPI, Provider'),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  Dividers("Simple List"),
                  Dividers("A. Stateless vs Stateful", true),
                  ScreenButton("1. Stateless List", WipScreen(),
                      subtitle: "Not interactive"),
                  ScreenButton("2. Stateful List", WipScreen(),
                      subtitle: "Add and Remove Interactivity"),
                  SizedBox(height: 20),
                  Dividers("B. SQLite", true),
                  ScreenButton("1. Manual Init", WipScreen(),
                      subtitle: "StatefulWidget is mandatory"),
                  ScreenButton("2. Auto Init", WipScreen(),
                      subtitle: "Stateless + Future Builder"),
                  SizedBox(height: 20),

                  Dividers("C. Provider (Mock-endpoint)", true),
                  ScreenButton("1. Auto Init ", AutoInitScreen(),
                      subtitle: "Stateless + ChangeNotifier"),
                  ScreenButton("2. Set State Chains ", AutoInitChainingScreen(),
                      subtitle: "Chaining `setState`"),
                  SizedBox(height: 20),

                  Dividers("D. Provider (Real Endpoint)", true),
                  ScreenButton("1. Auto Init ", AutoInitRestApiScreen(),
                      subtitle: "Stateless + ChangeNotifier"),
                  ScreenButton("2. Set State Chains ", AutoInitChainingRestApiScreen(),
                      subtitle: "Chaining `setState`"),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenButton extends StatelessWidget {
  final String title;
  final Widget child;
  final String subtitle;

  const ScreenButton(
    this.title,
    this.child, {
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("$title"),
            subtitle: subtitle != null ? Text("$subtitle") : null,
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return child;
                  },
                ),
              );
            },
          ),
          Dividers(),
        ],
      ),
    );
  }
}

class Dividers extends StatelessWidget {
  final String title;
  final bool isSubtitle;

  const Dividers([this.title, this.isSubtitle = false]);

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      if (isSubtitle) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Text(
            "$title :",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$title",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(
              color: Colors.black54,
            ),
          ],
        ),
      );
    }
    return Divider(
      color: Colors.black54,
    );
  }
}

class WipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oops.. '),
      ),
      body: Center(
        child: Text('Sorry, Work still on Progress'),
      ),
    );
  }
}