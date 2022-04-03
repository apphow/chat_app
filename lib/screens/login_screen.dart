import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(.3),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'harli',
                child: Container(
                  height: 400.0,
                  child: Image.asset(
                      'images/harli-marten-M9jrKDXOQoU-unsplash.jpg'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
