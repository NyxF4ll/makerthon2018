import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'package:makerthon2018/model/video.dart';

class VideoDisplayView extends StatefulWidget {

  final List<Video> videos;

  VideoDisplayView(this.videos);
  @override
  State<StatefulWidget> createState() => _VideoDisplayViewState(videos);

}

class _VideoDisplayViewState extends State<VideoDisplayView> {

  VideoPlayerController _controller;

  Queue<Video> _playQueue;
  final List<Video> _playList;

  _VideoDisplayViewState(this._playList) {
    _playQueue = Queue.from(_playList);
  }

  bool _isNotFinished(VideoPlayerController controller) =>
    controller.value.position.inSeconds != controller.value.duration.inSeconds;

  bool _isNull(VideoPlayerController controller) =>
    controller == null ||	controller.value == null ||	controller.value.position == null;


  void play() {
    void onVideoFinishedCallback() {
      if (_isNull(_controller) || _isNotFinished(_controller)) {
        return;
      }
      _controller.removeListener(onVideoFinishedCallback);
      play();
    }

    if (_playQueue.isEmpty) {
      return;
    }

    _controller = _playQueue.removeFirst().controller;
    _controller.initialize().then((_) => setState(() {}));
    _controller.addListener(onVideoFinishedCallback);
    _controller.play();
  }

  @override
  void initState() {
    super.initState();
    play();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          body: Center(
            child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
          ),
        );
  }

  @override
  void dispose() {
      _controller.dispose();
      super.dispose();
    }
}