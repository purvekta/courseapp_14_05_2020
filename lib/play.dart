import 'package:chewie/chewie.dart';
//import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Unit Name'});

  final String title;
  
  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;
  final String videoUrl ='https://www.pukemy.com/wp-content/uploads/2018/07/History_C_Programming.mp4';
//final String videoUrl ='https://vod-progressive.akamaized.net/exp=1589268073~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F3453%2F16%2F417265163%2F1798546684.mp4~hmac=1d1dc0124194feac9302712ea7cde1b8788085c3aeaae4786c78fdb43bcf8915/vimeo-prod-skyfire-std-us/01/3453/16/417265163/1798546684.mp4';
  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(videoUrl);
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _chewieController.enterFullScreen();
              },
              child: Text('Fullscreen'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _chewieController.dispose();
                        _videoPlayerController2.pause();
                        _videoPlayerController2.seekTo(Duration(seconds: 0));
                        _chewieController = ChewieController(
                          videoPlayerController: _videoPlayerController1,
                          aspectRatio: 3 / 2,
                          autoPlay: true,
                          looping: true,
                        );
                      });
                    },
                    child: Padding(
                      child: Text("Unit Name"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                /*
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _chewieController.dispose();
                        _videoPlayerController1.pause();
                        _videoPlayerController1.seekTo(Duration(seconds: 0));
                        _chewieController = ChewieController(
                          videoPlayerController: _videoPlayerController2,
                          aspectRatio: 3 / 2,
                          autoPlay: true,
                          looping: true,
                        );
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text("Error Video"),
                    ),
                  ),
                )
                */
              ],
            ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: FlatButton(
            //         onPressed: () {
            //           setState(() {
            //             _platform = TargetPlatform.android;
            //           });
            //         },
            //         child: Padding(
            //           child: Text("Android controls"),
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: FlatButton(
            //         onPressed: () {
            //           setState(() {
            //             _platform = TargetPlatform.iOS;
            //           });
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("iOS controls"),
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      );
  }
}
