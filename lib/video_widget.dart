import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final bool looping;
  final String networkUrl;
  const VideoWidget({Key? key, required this.looping, required this.networkUrl})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController? _controller;

  @override
  void initState() {
    try {
      _controller = VideoPlayerController.network(widget.networkUrl)
        ..initialize().then((value) {
          setState(() {});
        });
      _controller!.setLooping(true);
      _controller!.setPlaybackSpeed(1.0);
      _controller!.play();
    } on Exception catch (_) {
      _controller = null;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _controller != null && _controller!.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          )
        : Image.network(widget.networkUrl,
            height: MediaQuery.of(context).size.width / 2.2,
            width: MediaQuery.of(context).size.width / 2.2);
  }
}
