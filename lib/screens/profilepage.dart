/*
import 'dart:io';
import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File sampleImage;
 
  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
 
    setState(() {
      sampleImage = tempImage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Image Upload'),
        
      ),
      body: Column(children: <Widget>[
        RaisedButton(onPressed: getImage,
        child: Text('upload the image'),
        ),
        Center(
          child: sampleImage == null ? Text('select an image'): enableUpload(),
        ),

      ],
        
      ),
      );
    
  }
  
  Widget enableUpload(){
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0, width: 300.0),
          RaisedButton(
            elevation:7.0,
            child: Text('upload'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: (){
            final StorageReference firebaseStorageRef =
                  FirebaseStorage.instance.ref().child('myimage.jpg');
              final StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);
          })
        ]
      ),);
  }
}
*/
import 'package:flutter/material.dart';
import '../services/auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.teal.withOpacity(0.8)),
            clipper: getClipper(),
          ),
          Positioned(
            width: 350,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/images/tom.jpeg'),
                          fit: BoxFit.cover
                            // image: NetworkImage(
                            //     'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            // fit: BoxFit.cover),
                            ),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                         SizedBox(height: 90.0),
                         Text(
                  'Tom Cruise',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'My Course',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),                // Text(
                //   'Subscribe guys',
                //   style: TextStyle(
                //       fontSize: 17.0,
                //       fontStyle: FontStyle.italic,
                //       fontFamily: 'Montserrat'),
                // ),
                SizedBox(height: 25.0),
                Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                        Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Name',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                   // SizedBox(height: 25.0),
                    Container(
                      height: 30.0,
                      width:95.0,

                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.redAccent,
                        color:Colors.red,
                        elevation: 7,
                         child: GestureDetector(
                           onTap: ()
                           async{
                             await _auth.signOut();
                             },
                           child: Center(
                             child: Text('LogOut'),)
                         )
                      ),)
                    ],
                ),
                
              ],)
            )
        ],
      ),
    );
  }
  
}
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}