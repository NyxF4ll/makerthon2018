import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'package:makerthon2018/model/video.dart';
import 'package:makerthon2018/app_navigator.dart';

class VideoDisplayView extends StatefulWidget {

  final Function _videosSupplier;

  VideoDisplayView(this._videosSupplier);

  @override
  State<StatefulWidget> createState() => _VideoDisplayViewState(_videosSupplier);

}

class _VideoDisplayViewState extends State<VideoDisplayView> {

  VideoPlayerController _controller;

  bool _isNotPlaying;
  bool _hasplayed;
  String _currentVideoDescription;

  Queue<Video> _playQueue;
  final Function _videosSupplier;

  _VideoDisplayViewState(this._videosSupplier) {
    _isNotPlaying = true;
    _hasplayed = false;
    _playQueue = Queue.from(_videosSupplier.call());
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

    if (_playQueue.isNotEmpty) print("path: " + _playQueue.first.toString());

    while (_playQueue.isNotEmpty && _playQueue.first == null) {
      setState(() {
        this._playQueue.removeFirst();
        this._isNotPlaying = true;
      });
    }

    if (_playQueue.isEmpty) {
      setState(() {
        this._isNotPlaying = true;
      });

      return;
    }

    _isNotPlaying = false;
    _hasplayed = true;
    
    _currentVideoDescription = _playQueue.first.name;
    _controller = _playQueue.removeFirst().controller;
    _controller.initialize().then((_) {
      setState(() {});
      _controller.addListener(onVideoFinishedCallback);
      _controller.play();
    });
  }

  void replay() {
    _playQueue = Queue.from(_videosSupplier.call());
    play();
  }

  @override
  void initState() {
    super.initState();
    _controller = _playQueue.first.controller;
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height - 160,
      color: Colors.black87,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
            Center(
              child: (_controller != null && _controller.value.initialized) ?
                Container(
                  child: AspectRatio(
                    aspectRatio: 4/3,
                    child: VideoPlayer(_controller),
                  )
                ) : 
                Container()),
            _isNotPlaying ? Opacity(
              opacity: 0.7, 
              child: Container(color: Colors.black)
            ) : Container(),
            _isNotPlaying ? Container(
              child: Center(
                child: InkWell(
                  child:Icon((_hasplayed) ? Icons.refresh : Icons.play_arrow, color: Colors.white, size: 100.0),
                  onTap: () {
                    setState(() {});
                    replay();
                  }
                )
              )
            ) : Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(_currentVideoDescription, style: TextStyle(color: Colors.white, fontSize: 70.0)),
            ),
          ])
        ],
      )
    );
  }

  @override
  void dispose() {
      _controller.dispose();
      super.dispose();
      print("disposed");
  }
}