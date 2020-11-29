import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  //search for users in firestore
  getUserByUsername(String username) async{
      return await FirebaseFirestore.instance.collection("users")
        .where("name", isEqualTo: username )
          .get();
  }
  uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection("users")
    .add(userMap);
  }
  createChatRoom(String chatRoomId,  chatRoomMap){
  FirebaseFirestore.instance.collection("ChatRoom").doc(chatRoomId).set(chatRoomMap).catchError((e){
    print(e.toString());
  });
}


}