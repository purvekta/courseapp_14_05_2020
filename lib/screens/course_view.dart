import 'package:courseapp/models/categories.dart';
import 'package:courseapp/models/constants.dart';
import 'package:flutter/material.dart';
import './customshapeclipper.dart';
import 'package:share/share.dart';
import '../models/videoplayer/vimeoscreen.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String text = 'Share with others https://www.pukemy.com';
  String subject = 'https://www.pukemy.com';
  String courseName = 'Maths';
  String courseUrl =
      'https://www.pukemy.com/wp-content/uploads/2018/07/History_C_Programming.mp4';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  color: Colors.teal,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Hello\n Student',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                width: 50,
                top: 50,
                right: 50,
                child: Container(

                    // mainAxisAlignment: MainAxisAlignment.end,
                    width: 50.0,
                    height: 50.0,
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
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Subjects'),

          /// try container with grid view was here
          /// ends
          // another approach
          Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 100,
                  //color: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/course/biology.jpg'),
                      fit: BoxFit.cover,
                      //centerSlice:
                    ),
                  ),
                  child: GestureDetector(
                    child: Text('Maths'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/MyCourse');
                    },
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 150,
                  height: 100,
                  //color: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/course/c programming.jpg'),
                      fit: BoxFit.cover,
                      //centerSlice:
                    ),
                  ),
                  child: GestureDetector(
                    child: Text('Maths'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/MyCourse');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 100,
                  //color: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/course/chemistry.jpg'),
                      fit: BoxFit.cover,
                      //centerSlice:
                    ),
                  ),
                  child: GestureDetector(
                    child: Text('Maths'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/MyCourse');
                    },
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 150,
                  height: 100,
                  //color: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/course/jee.png'),
                      fit: BoxFit.cover,
                      //centerSlice:
                    ),
                  ),
                  child: GestureDetector(
                    child: Text('Maths'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/MyCourse');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 100,
                  //color: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/course/maths.jpg'),
                      fit: BoxFit.cover,
                      //centerSlice:
                    ),
                  ),
                  child: GestureDetector(
                    child: Text('Maths'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/MyCourse');
                    },
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 150,
                  height: 100,

                  //color: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/course/physics.png'),
                      fit: BoxFit.cover,
                      //centerSlice:
                    ),
                  ),
                  child: GestureDetector(
                    child: Text('Maths'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/MyCourse');
                    },
                  ),
                ),
              ],
            )
          ]),

          /// andother ends
          Container(
            color: Colors.teal,
            height: 30,
            width: 400,
            child: Text(
              'Popular Videos',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          // Text('share this with Friends',
          // style :  kHeadingextStyle),
          // Container(
          //   color: Colors.tealAccent,
          //   height: 30,
          //   width: 400,
          //   child: Text('Recently Learned',
          //   style :  kHeadingextStyle),
          // ),
          // listview Builder starts for popular videos
          // Container(
          //   height: 250,
          //   width: 400,
          //   color: Colors.white,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 5,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Card(
          //           color: Colors.white,
          //           margin: EdgeInsets.all(20),
          //           child: Container(
          //             width: 150,
          //             height: 100,
          //             //color: Colors.blue,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(40),
          //               color: Colors.red,
          //               image: DecorationImage(
          //                 image: AssetImage('assets/course/physics.png'),
          //                 fit: BoxFit.cover,
          //                 //centerSlice:
          //               ),
          //             ),
          //             child: GestureDetector(
          //               ///child: Text('Popular Videos'),
          //               onTap: () {
          //                 Navigator.of(context).pushNamed('/PlayVideo');
          //               },
          //             ),
          //           ),
          //         );
          //       }),
          // ),
          //listview buidler ends for popular videos

          ///custom listview with fixed items

          Container(
              color: Colors.white,
              height: 200,
              width: 400,
              //padding: EdgeInsets.all(20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/course/physics.png'),
                          fit: BoxFit.scaleDown,
                          //centerSlice:
                        ),
                      ),
                      child: GestureDetector(
                        child: Text('Physics'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (ctx) => VimeoScreen(
                                      courseName: 'Physics',
                                      courseUrl: courseUrl,
                                    )),
                          );
                          //Navigator.of(context).pushNamed('/PlayVideo');
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 150,
                    height: 100,
                    padding: EdgeInsets.all(20),
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/course/maths.jpg'),
                        fit: BoxFit.scaleDown,
                        //centerSlice:
                      ),
                    ),
                    child: GestureDetector(
                      child: Text('Maths'),
                      onTap: () {
                        Navigator.of(context).pushNamed('/PlayVideo');
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 150,
                    height: 100,
                    padding: EdgeInsets.all(20),
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/course/jee.png'),
                        fit: BoxFit.scaleDown,
                        //centerSlice:
                      ),
                    ),
                    child: GestureDetector(
                      child: Text('Maths'),
                      onTap: () {
                        Navigator.of(context).pushNamed('/PlayVideo');
                      },
                    ),
                  ),
                ],
              )),

          ///custom ListView ends
          Container(
            color: Colors.teal,
            height: 30,
            width: 400,
            child: RaisedButton(
              color: Colors.teal,
              child: Text(
                'Share with Others',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                final RenderBox box = context.findRenderObject();
                Share.share(text,
                    subject: subject,
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);

                // Share.share('check out my website https://www.pukemy.com');
              },
            ),
          ),
          ////try for sliverGrid

          ///end for SliverGrid
        ]),
      ),
    );
  }
}
