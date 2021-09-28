//import 'package:courseapp/screens/mycoursepage.dart';
import 'package:flutter/material.dart';

import './screens/home.dart';
 class Wrapper extends StatefulWidget {
   @override
   _WrapperState createState() => _WrapperState();
 }
 
 class _WrapperState extends State<Wrapper> {
   @override
   Widget build(BuildContext context) {
     return HomePage();
    // return CoursePage();
   }
 }