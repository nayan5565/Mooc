import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerView extends StatefulWidget {
  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1?.dispose();
    _chewieController?.dispose();
    _videoPlayerController1.pause();
    // _onControllerChange();
    super.dispose();
  }

  Future<void> _onControllerChange() async {
    if (_chewieController == null) {
      // If there was no controller, just create a new one
      initializePlayer();
    } else {
      // If there was a controller, we need to dispose of the old one first
      final oldController = _chewieController;

      // Registering a callback for the end of next frame
      // to dispose of an old controller
      // (which won't be used anymore after calling setState)
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        oldController.dispose();

        // Initing new controller
        initializePlayer();
      });

      // Making sure that controller is not used by setting it to null
      setState(() {
        _chewieController = null;
      });
    }
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4');
    // _videoPlayerController2 = VideoPlayerController.network(
    //     'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4');
    await Future.wait([
      _videoPlayerController1.initialize(),
      // _videoPlayerController2.initialize()
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: false,

      // fullScreenByDefault: true
      // Try playing around with some of these other options:

      // showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.black,
      ),
      autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('widget.title'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.black,
                child: Center(
                  child: _chewieController != null &&
                          _chewieController
                              .videoPlayerController.value.isInitialized
                      ? Chewie(
                          controller: _chewieController,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text(
                              'Loading',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () async {
            //     Duration fw = await _videoPlayerController1.position;
            //     int fs = fw.inSeconds + 5;
            //     _videoPlayerController1.seekTo(Duration(seconds: fs));
            //   },
            //   child: const Text('Fullscreen'),
            // ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {
            //           setState(() {
            //             _chewieController.dispose();
            //             _videoPlayerController1.pause();
            //             _videoPlayerController1.seekTo(const Duration());
            //             _chewieController = ChewieController(
            //               videoPlayerController: _videoPlayerController1,
            //               autoPlay: true,
            //               looping: true,
            //             );
            //           });
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("Landscape Video"),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {
            //           setState(() {
            //             _chewieController.dispose();
            //             _videoPlayerController2.pause();
            //             _videoPlayerController2.seekTo(const Duration());
            //             _chewieController = ChewieController(
            //               videoPlayerController: _videoPlayerController2,
            //               autoPlay: true,
            //               looping: true,
            //             );
            //           });
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("Portrait Video"),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {
            //           setState(() {
            //             _platform = TargetPlatform.android;
            //           });
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("Android controls"),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {
            //           setState(() {
            //             _platform = TargetPlatform.iOS;
            //           });
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("iOS controls"),
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
