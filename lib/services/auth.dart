import 'package:courseapp/services/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// create a user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // guest  user with annoy method

  Future sigInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// signin user with email and password

  Future signInwithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// register user with email and password
  Future registerwithEmailAndPassword(String email, String password,String nickName) async {
    try {
      // AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //FirebaseUser user = result.user;
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nickName;
      userUpdateInfo.photoUrl =
          'https://en.wikipedia.org/wiki/Irrfan_Khan#/media/File:Irrfan_Khan_May_2015.jpg';
      //var mobNo = mobNo;
      FirebaseUser user = result.user;
      user.updateProfile(userUpdateInfo);
      //create a new document when new user registers with the uid
      //await UserManagement(uid:user.uid).updateUserDData('emailid','name');
      await UserManagement(uid: user.uid).updateUserDData(email,userUpdateInfo.displayName,userUpdateInfo.photoUrl );

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// signout method
  ///

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
