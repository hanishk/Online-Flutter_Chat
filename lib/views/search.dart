import 'package:chat_app/services/database.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();
  QuerySnapshot searchSnapShot;

  initiateSearch(){
     databaseMethods.getUserByUsername(searchTextEditingController.text).then((val){
       setState(() {
         searchSnapShot = val;
       });
     });         
  }
  // save data locally in our phone using SharedPreferences
createChatRoomAndStartConversation(){
  // databaseMethods.createChatRoom(userName, myName)
}
Widget searchList(){
  return searchSnapShot !=null ? ListView.builder(
    itemCount:searchSnapShot.docs.length ,
    shrinkWrap: true,
    itemBuilder: (context,index){
      return SearchTile(searchSnapShot.docs[index].data["name"],searchSnapShot.docs[index].data["email"]);
    })
}

void initState(){
  super.initState();
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        body: Container(
          child: Column(
            children: [
              Container(
                  color: Color(0x54FFFFFF),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            controller: searchTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "search username...",
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            border: InputBorder.none),
                      )),
                      GestureDetector(
                        onTap: (){
                             initiateSearch();
                        },
                            child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0x36FFFFFF),
                                const Color(0x0FFFFFFF)
                              ]
                            ),
                            borderRadius: BorderRadius.circular(40)
                            
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(Icons.search),
                          // child: Image.asset("asset/images/search_white.png",height: 25,width: 25),
                          ),
                      )
                    ],
                  )),
                  searchList()
            ],
          ),
        ));
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  
  // get value by constructor
  SearchTile(this.userName,this.userEmail);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical:16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,style: mediumTextStyle(),),
              Text(userEmail,style: mediumTextStyle(),)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              // create chatRoom , send user to conversation screen, pushreplacement
            },
                      child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Text("Message",style: mediumTextStyle(),),
            ),
          )
        ],
      ),

    );
  }
}
