import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'package:makerthon2018/model/video.dart';
import 'package:makerthon2018/app_navigator.dart';

class VideoDisplayView extends StatefulWidget {

  final List<Video> videos;

  VideoDisplayView(this.videos);
  @override
  State<StatefulWidget> createState() => _VideoDisplayViewState(videos);

}

class _VideoDisplayViewState extends State<VideoDisplayView> {

  VideoPlayerController _controller;

  bool _isNotPlaying;
  String _currentVideoDescription;

  Queue<Video> _playQueue;
  final List<Video> _playList;

  _VideoDisplayViewState(this._playList) {
    _isNotPlaying = true;
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
      setState(() {this._isNotPlaying = true;});

      return;
    }

    _isNotPlaying = false;
    _currentVideoDescription = _playQueue.first.name;
    _controller = _playQueue.removeFirst().controller;
    _controller.initialize().then((_) => setState(() {}));
    _controller.addListener(onVideoFinishedCallback);
    _controller.play();
  }

  void replay() {
    _playQueue = Queue.from(_playList);
    play();
  }

  @override
  void initState() {
    super.initState();
    play();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppNavigator.of(context).returnToMenu(), 
        child: Icon(Icons.close, size: 50.0), backgroundColor: Colors.transparent, 
        foregroundColor: Colors.white,
        ),
      body: new Stack(children: <Widget>[
        Center(
          child: _controller.value.initialized ?
            Container(
              constraints: BoxConstraints.expand(),
              child: VideoPlayer(_controller),
            ) : 
            Container()),
        _isNotPlaying ? Opacity(
          opacity: 0.7, 
          child: Container(color: Colors.black)
        ) : Container(),
        _isNotPlaying ? Container(
          child: Center(
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.refresh, color: Colors.white, size: 100.0),
                ],
              ),
              onTap: () => replay(),
            )
          )
        ) : Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text(_currentVideoDescription, style: TextStyle(color: Colors.white, fontSize: 50.0)),
        ),
      ])
    );
  }

  @override
  void dispose() {
      _controller.dispose();
      super.dispose();
    }
}