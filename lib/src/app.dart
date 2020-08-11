import 'package:flutter/material.dart';
import './screens/login_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'Log Me In!',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.black38,
        ),
        body: LoginScreen()
      ),
    );
  }
}