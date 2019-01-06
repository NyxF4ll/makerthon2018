import 'package:makerthon2018/model/video.dart';
import 'package:makerthon2018/model/modifier.dart';

class Order {
  final String _drinkName;
  final List<Video> _drinkGesture;
  final List<Modifier> _modifiers;
  final String _image;

  const Order(this._drinkName, this._drinkGesture, this._modifiers, this._image);

  Order copy() => 
    Order(this._drinkName, this._drinkGesture, this._modifiers, this._image);

  Order withModifiers(List<Modifier> modifiers) => 
    Order(this._drinkName, this._drinkGesture, modifiers, this._image);
  
  Order withoutModifiers() =>
    Order(this._drinkName, this._drinkGesture, [], this._image);

  List<Video> get videos =>
    (_drinkGesture + _modifiers.map((m) => m.video).toList()).toList();

  String get image => _image;

  String get name => _drinkName + 
    _modifiers.map((m) => m.name).fold("", (a,b) => a + " " + b);
}