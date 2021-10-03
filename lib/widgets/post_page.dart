import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slingshot/utils.dart';

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
                child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Center(
                  child: VideoWidget(
                    looping: true,
                    networkUrl: widget.networkUrl,
                  ),
                ),
                Column(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.red.shade900.withOpacity(1),
                                Colors.black.withOpacity(0.1)
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            const Text('Title (This is a very cool video)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            const SizedBox(height: 10),
                            const Text(
                                'I love to play video games\nline1\nline2',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                )),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(children: const [
                                  Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ]),
                                Row(children: const [
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text('10',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                ]),
                                Row(children: const [
                                  Icon(
                                    Icons.comment,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text('10',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                ]),
                                Row(children: const [
                                  Icon(
                                    Icons.report,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                ]),
                                Row(children: const [
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
            decoration: kInnerDecoration,
          )),
      decoration: kGradientBoxDecoration(
          colors: [Colors.red.shade900, Colors.blue.shade900],
          isVerticalGrad: true),
    );
  }
}
