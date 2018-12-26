import 'package:makerthon2018/model/video.dart';

class Modifier {
  final String _name;
  final Video _video;

  Modifier(this._name, this._video);

  String get name => _name;
  Video get video => _video;
}