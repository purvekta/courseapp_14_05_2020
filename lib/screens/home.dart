import 'package:courseapp/sharing/loading.dart';

import './course_details_page.dart';

import 'package:courseapp/services/auth.dart';
import 'package:flutter/material.dart';
import './profilepage.dart';
import './allcourse.dart';
import './blogPage.dart';
import 'course_view.dart';
//import 'landingPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

//bool _isLoading = false;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
          color: Colors.teal,
          child: TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.menu),
              ),
              Tab(
                icon: Icon(Icons.more),
              ),
              Tab(
                icon: Icon(Icons.people),
              ),
            ],

          )),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
           CoursePage(),
           // LandingPage(),
            // DetailsScreen(),
             AllCoursePage(),
               BlogPage(),
               ProfilePage(),
                
            ],),

            
    );
  }
}
