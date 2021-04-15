import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayerController extends GetxController{
  String videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=BBAyRBTfsOU");
  YoutubePlayerController youtubePlayerController = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=BBAyRBTfsOU"),
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );
}