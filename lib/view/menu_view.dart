import 'package:flutter/material.dart';

import 'package:makerthon2018/model/menu.dart';

import 'package:makerthon2018/app_navigator.dart';

class MenuView extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(body: Container(
      child: RaisedButton(onPressed: () => AppNavigator.of(context).submitOrder(BLACK_TEA)),
    ),);
  }
}
