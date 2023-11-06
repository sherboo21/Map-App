import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/screens/video_player/components/video_player_imports.dart';
class VideoPlayerItem extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : SizedBox(
        height: 200,
        child: Center(
            child: CircularProgressIndicator(
              color: AppColors.mainAppColor,
            )),
      );

  Widget buildVideo() => Stack(
    children: <Widget>[
      buildVideoPlayer(),
      Positioned.fill(child: BasicOverlay(controller: controller)),
    ],
  );

  Widget buildVideoPlayer() => AspectRatio(
    aspectRatio: controller.value.aspectRatio,
    child: VideoPlayer(controller),
  );
}