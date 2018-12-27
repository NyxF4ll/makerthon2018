import 'package:makerthon2018/model/video.dart';
import 'package:makerthon2018/model/modifier.dart';

class Order {
  final String _drinkName;
  final List<Video> _drinkGesture;
  final List<Modifier> _modifiers;

  const Order(this._drinkName, this._drinkGesture, this._modifiers);

  Order withModifiers(List<Modifier> modifiers) => 
    Order(this._drinkName, this._drinkGesture, modifiers);
  
  Order withoutModifiers() =>
    Order(this._drinkName, this._drinkGesture, []);

  List<Video> get videos => _drinkGesture;
    //(_drinkGesture + _modifiers.map((m) => m.video)).toList();

  String get name => _drinkName + 
    _modifiers.map((m) => m.name).fold("", (a,b) => a + b);
}