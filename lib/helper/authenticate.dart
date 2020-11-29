import 'package:chat_app/views/sigin.dart';
import 'package:chat_app/views/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // intially signIn
  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
     if(showSignIn){
      return SignIn(toggleView);
    }else{
      return SignUp(toggleView);
    }
      
    
  }
}