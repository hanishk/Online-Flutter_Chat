import 'package:chat_app/helper/authenticate.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/search.dart';
import 'package:flutter/material.dart';


class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthService authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: Text("Chat App"),
    actions: [
      GestureDetector(
        onTap: (){
          // go to sign in screen
          authService.signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Authenticate()));
          
        },
        child:
         Container(
           padding: EdgeInsets.symmetric(horizontal: 16),
           child: Icon(Icons.exit_to_app))),
    ],
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
    },
    child: Icon(Icons.search),
    ),
    );
  }
}