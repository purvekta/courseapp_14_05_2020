import 'package:courseapp/models/user.dart';
import 'package:courseapp/screens/course_details_page.dart';
//import 'package:courseapp/screens/mycoursepage.dart';
import 'package:courseapp/screens/profilepage.dart';
//import 'package:courseapp/screens/profilepage.dart';
import 'package:courseapp/services/auth.dart';

import './screens/signup.dart';
import 'package:flutter/material.dart';
///import 'package:archive/archive_io.dart';
import './screens/landingPage.dart';
import 'package:provider/provider.dart';
import 'screens/profilepage.dart';
import './screens/home.dart';
//import './wrapper.dart';
import './authenticate/authenticate.dart';
import './try.dart';
import './play.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Color(0xffFFDCD6)
        ),
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => SignupPage(),
          '/HomePage': (BuildContext context) => HomePage(),
          '/LandingPage': (BuildContext context) => LandingPage(),
          '/MyProfile': (BuildContext context) => ProfilePage(),
          '/MyCourse': (BuildContext context) => DetailsScreen(),
          '/PlayVideo': (BuildContext context) => ChewieDemo(),
          


        },
      // home: TryClass(),
       home: Authenticate(),
      //home:ProfilePage(),
      ),
    );
  }
}