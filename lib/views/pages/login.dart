import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var _ctrlEmail = TextEditingController();
  var _ctrlpassword = TextEditingController();

  void _onPressed(BuildContext context) {
    bool validEmail = isValidEmail(_ctrlEmail.text);
    bool validPassword = isValidPassword(_ctrlpassword.text);

    // 1st validation
    if (_ctrlEmail.text == "" || _ctrlpassword.text == "") {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Email and Password must be filled')));
    }
    // 2nd
    else if (!validEmail) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Email format is invalid')));
    }
    // 3rd
    else if (!validPassword) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              'Password length must be at least 8 characters and in alpha numeric format')));
    }

    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: globals.darkTheme ?ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          body: HomePage(),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/logo-otten-coffee.png'),
          TextField(
            decoration: InputDecoration(hintText: 'Email'),
            controller: _ctrlEmail,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Password'),
            obscureText: true,
            controller: _ctrlpassword,
          ),
          ElevatedButton(
              onPressed: () => _onPressed(context), child: Text('Login'))
        ],
      ),
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.all(20),
    );
  }

  bool isValidEmail(String text) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
  }

  bool isValidPassword(String text) {
    if (text.length < 8) {
      return false;
    }
    return RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$').hasMatch(text);
  }
}
