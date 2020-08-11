import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  resetButton(),
                  submitButton()
                ],
              )
            ],
          ),
        )
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email',
        hintText: 'Please input your email'
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Password',
        hintText: 'Please input your password'
      ),
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.lightBlueAccent,
      disabledColor: Colors.cyan,
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.black
        ),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(email);
          print(password);
        }
      }
    );
  }

  Widget resetButton() {
    return RaisedButton(
      color: Colors.redAccent,
      child: Text(
        'Reset',
        style: TextStyle(
          color: Colors.black
        ),
      ),
      onPressed: () {
        formKey.currentState.reset();
      }
    );
  }
}