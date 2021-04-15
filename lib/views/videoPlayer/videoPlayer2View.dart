import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'videoItems.dart';

class VideoPlayer2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoItems(
        videoPlayerController: VideoPlayerController.network(
            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4'),
        looping: false,
        autoplay: true,
      ),
    );
  }
}
