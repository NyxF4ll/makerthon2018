import 'package:flutter/material.dart';

import 'package:makerthon2018/model/order.dart';

class OrderCustomizationView extends StatefulWidget {

  final Order order;
  
  OrderCustomizationView(this.order);

  @override
  State<StatefulWidget> createState() => _OrderCustomizationViewState(order);

}

class _OrderCustomizationViewState extends State<OrderCustomizationView> {

  Order order;

  _OrderCustomizationViewState(this.order);

  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return null;
  }
}