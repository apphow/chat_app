import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//able to act as a ticker for a single animation
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // controls actions of the animation
  // variable of type AnimationController
  AnimationController controller;
  Animation animation;

  //we want to initialize it when our state object gets
  //initialized (initState method gets called when _WelcomeScreenState()
  //gets created
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      // TicketProvider is our WelcomeScreenState object
      vsync: this,
    );
    //animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation =
        ColorTween(begin: Colors.orange[100], end: Colors.red.withOpacity(.2))
            .animate(controller);
    //our controller will animate ahead in 60 steps (ticks)(
    controller.forward();
    animation.addStatusListener((status) {
      print(status);
    });
    // to see what the controller is doing, we need
    // to add a listener to it. Listener takes a callback
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: animation.value,
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text(
          'Family',
          style: TextStyle(
            color: Colors.red[900],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Container(
                height: 60,
                child: Center(
                  child: Text(
                    '️Chatting',
                    style: TextStyle(fontSize: 38.0, color: Colors.red[300]),
                  ),
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              Hero(
                tag: 'harli',
                child: Container(
                  child: Image.asset(
                      'images/harli-marten-M9jrKDXOQoU-unsplash.jpg'),
                  height: 300,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RoundedButton(
                  title: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
              RoundedButton(
                  title: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
