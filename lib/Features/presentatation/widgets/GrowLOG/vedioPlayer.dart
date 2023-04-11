import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VedioPlayer extends StatefulWidget {
  String vedioid;
  VedioPlayer({super.key, required this.vedioid});

  @override
  State<VedioPlayer> createState() => _VedioPlayerState();
}

class _VedioPlayerState extends State<VedioPlayer> {
  final YoutubePlayerController contorller = YoutubePlayerController(
    params: const YoutubePlayerParams(
      strictRelatedVideos: true,
      showControls: true,
      showFullscreenButton: false,
    ),
  );
  @override
  void initState() {
    //  final YoutubePlayerController controller;
    // controller = YoutubePlayerController.fromVideoId(
    //   videoId: widget.vedioid,
    //   autoPlay: false,
    //   params: const YoutubePlayerParams(
    //     strictRelatedVideos: true,
    //     showControls: true,
    //     showFullscreenButton: false,
    //   ),
    // );

    super.initState();
  }

  @override
  void dispose() {
    print("CALLED");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    contorller.loadVideo(widget.vedioid).then((value) {});
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: YoutubePlayer(
          aspectRatio: 16 / 9,
          enableFullScreenOnVerticalDrag: false,
          backgroundColor: Colors.orange,
          controller: contorller,
        ));
  }
}
