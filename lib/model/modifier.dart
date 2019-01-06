import 'package:makerthon2018/model/video.dart';

class Modifier {
  final String _name;
  final String _icon;
  final Video _video;

  const Modifier(this._name, this._icon, this._video);

  String get name => _name;
  Video get video => _video;
  String get icon => _icon;
}