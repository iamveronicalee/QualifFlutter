import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      // home: LoginPage(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Otten Coffee'),
        ),
        body: LoginPage(),
      ),
    );
  }
}
