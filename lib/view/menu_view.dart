import 'package:flutter/material.dart';
import 'package:makerthon2018/model/menu.dart';
import 'package:makerthon2018/app_navigator.dart';
import 'dart:ui';

Widget build(BuildContext context) {
  return new Scaffold(
    body: new ListView.builder(
      itemCount: MENU == null ? 0 : MENU.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          onTap: () => AppNavigator.of(context).submitOrder(MENU[index]),
          child: new Column (
            children: <Widget>[
            new Image.asset('assets/image/image${index + 1}.jpg'),
            new Container(
              child: new Text(MENUSTRING[index], style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],),
        );
      },
    ),
  );
}

List<Widget> list = <Widget>[
  ListTile(
    title: Text('KOPI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0)),
  )
];

class MenuView extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    var titleText = Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Select your drinks:',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.3,
          fontSize: 30.0,
        ),
      ),
    );

    var listMenu = Container(
      child: Column(
        children: list,
      ),
    );

    var leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      child: Column(
        children: [
          titleText,
          listMenu,
        ],
      ),
    );

    var mainImage = Image.asset(
      'assets/images/background.jpg',
      height: screenHeight,
      width: 4*screenWidth/9,
      fit: BoxFit.fill,
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Drinks Menu'),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          height: screenHeight,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth/2,
                  child: leftColumn,
                ),
                mainImage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
