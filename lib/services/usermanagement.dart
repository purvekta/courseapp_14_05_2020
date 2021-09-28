import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
// class UserManagement{
//   storeNewUser(user){
//     Firestore.instance.collection('/users').add({

//     }).then(
//       (){

//       }
//     ).catchError((e){
//       print(e);
//     });
//   }
// }

class UserManagement{
  final String uid;
  UserManagement({this.uid});
  //sstore the data in the firebase collection  database
  final CollectionReference userCollection =Firestore.instance.collection('/users');

  Future updateUserDData(String emailId,String displayName,String photoUrl) async{

    return await userCollection.document(uid).setData({
          'emailid' : emailId,
          'Nick name': displayName,
          'avatar': photoUrl,
          
    });
  }

  
}