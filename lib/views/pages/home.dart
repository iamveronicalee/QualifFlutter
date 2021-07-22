import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/login.dart';

import 'list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool isSwitched = false;

  void _onPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Otten Coffee'),
          ),
          body: ListPage(),
        ),
      );
    }));
  }

  void _onPressedLogout() {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Otten Coffee'),
          ),
          body: LoginPage(),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Otten Coffee'),
        ),
        drawer: Drawer(
            child: ListView(children: [
          ListTile(
            title: TextButton(
              child: Text('Products'),
              onPressed: _onPressed,
            ),
          ),
          // ListTile(
          //   trailing: Text('Items'),
          // ),
          ListTile(
            title: TextButton(
              child: Text('Logout'),
              onPressed: _onPressedLogout,
            ),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          )
        ])));
  }
}
