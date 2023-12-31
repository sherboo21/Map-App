import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/screens/video_player/components/video_player_imports.dart';

class BasicOverlay extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlay({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () =>
    controller.value.isPlaying ? controller.pause() : controller.play(),
    child: Stack(
      children: <Widget>[
        buildPlay(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: buildIndicator(),
        ),
      ],
    ),
  );

  Widget buildIndicator() => VideoProgressIndicator(
    controller,
    allowScrubbing: true,
  );

  Widget buildPlay() => controller.value.isPlaying
      ? const SizedBox()
      : Container(
    alignment: Alignment.center,
    color: Colors.black26,
    child: const Icon(Icons.play_arrow, color: Colors.white, size: 80),
  );
}