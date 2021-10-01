import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'utils.dart';
import 'video_widget.dart';

class PostWidget extends StatefulWidget {
  final String networkUrl;
  const PostWidget({Key? key, required this.networkUrl}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            child: Center(
                child: VideoWidget(
              looping: true,
              networkUrl: widget.networkUrl,
            )),
            decoration: kInnerDecoration,
          )),
      decoration: kGradientBoxDecoration(
          colors: [Colors.red.shade900, Colors.blue.shade900],
          isVerticalGrad: true),
    );
  }
}
