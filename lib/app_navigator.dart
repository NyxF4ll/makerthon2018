import 'package:flutter/material.dart';

import 'package:makerthon2018/model/order.dart';
import 'package:makerthon2018/view/video_display_view.dart';
import 'package:makerthon2018/view/order_customization_view.dart';

class AppNavigator {
  BuildContext _context;

  AppNavigator(this._context);

  factory AppNavigator.of(BuildContext context) => AppNavigator(context);

  void returnToMenu() {
    Navigator.popUntil(_context, 
      ModalRoute.withName(Navigator.defaultRouteName));
  }

  // void submitOrder(Order order) {
  //   MaterialPageRoute videoViewRoute =
  //     MaterialPageRoute(builder: (_context) => VideoDisplayView(order.videos));

  //   Navigator.of(_context).push(videoViewRoute);
  // }

  void selectDrink(Order order) {
    MaterialPageRoute customizationViewRoute =
      MaterialPageRoute(builder: (_context) => OrderCustomizationView(order));

    Navigator.of(_context).push(customizationViewRoute);
  }
}