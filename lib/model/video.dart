import 'package:video_player/video_player.dart';

class Video {
  final String _path;
  
  const Video(this._path);

  String get path => _path;

  VideoPlayerController get controller => VideoPlayerController.asset(_path);
}