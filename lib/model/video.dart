import 'package:video_player/video_player.dart';

class Video {
  final String _path;
  final String _name;
  
  const Video(this._path, this._name);

  String get path => _path;
  String get name => _name;

  VideoPlayerController get controller => VideoPlayerController.asset(_path);
}