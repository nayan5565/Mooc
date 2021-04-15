import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  VideoItems({
    @required this.videoPlayerController,
    this.looping,
    this.autoplay,
    Key key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  ChewieController _chewieController;
  bool isLoadingError = false;

  Future<void> initializePlayer() async {
    await Future.wait([
      widget.videoPlayerController.initialize(),
    ]);

    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      // aspectRatio:5/8,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.black,
      ),
      errorBuilder: (context, errorMessage) {
        isLoadingError = true;
        print('errorMessage: $errorMessage');
        setState(() {});
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController?.dispose();
    widget.videoPlayerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: _chewieController != null &&
                _chewieController.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController,
              )
            : !isLoadingError
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text(
                        'Loading',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                : Chewie(
                    controller: _chewieController,
                  ),
      ),
    );
  }
}
