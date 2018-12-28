import 'package:flutter/material.dart';
import 'package:makerthon2018/model/menu.dart';
import 'package:makerthon2018/app_navigator.dart';
import 'dart:ui';

// Widget build(BuildContext context) {
//   return new Scaffold(
//     body: new ListView.builder(
//       itemCount: MENU == null ? 0 : MENU.length,
//       itemBuilder: (BuildContext context, int index) {
//         return new GestureDetector(
//           onTap: () => AppNavigator.of(context).submitOrder(MENU[index]),
//           child: new Column (
//             children: <Widget>[
//               new Image.asset('assets/image/image${index + 1}.jpg'),
//               new Container(
//                 child: new Text(MENUSTRING[index], style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
//               )
//             ],
//             ),
//         );
//       },
//     ),
//   );
// }

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

    var menuColumn = ListView.builder(itemCount: 6, itemBuilder: (context, index) => new Container(
      height: 200,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
      color: Color.fromRGBO(80, 80, 80, 1),
      child: new InkWell(
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2/1,
              child: Image.asset(MENU[index].image,
                fit: BoxFit.fitWidth,
              )
            ),
            Container(
              constraints: BoxConstraints.tightFor(width: screenWidth/2 - 400),
              color: Colors.black87,
              child: Center(
                child: Text(MENU[index].name, style: TextStyle(color: Colors.white, fontSize: 30.0)),
              ),
            )
          ]),
        onTap: () {
          print(MENU[index].name);
          AppNavigator.of(context).submitOrder(MENU[index]);
        })
      )
    );


    var mainImage = Image.asset(
      'assets/images/background.jpg',
      height: screenHeight,
      fit: BoxFit.fitHeight,
    );

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('Drinks Menu'),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          color: Color.fromRGBO(80, 80, 80, 1),
          height: screenHeight,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth/2 - 4,
                  child: menuColumn,
                ),
                Container(
                  width: screenWidth/2 - 4,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      mainImage,
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 27.0),
                        child: Container(
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(35,25,35,25),
                                child: Text("Meet Peter", style: TextStyle(fontSize: 47, color: Colors.white)),
                                
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(35,0,35,35),
                                child: Text("Dignity Kitchen’s resident kopi master, Peter\n\n" +
                                  "has been with the Project Dignity family for\n\n" +
                                  "close to a decade. Affectionately known as\n\n" +
                                  "“Uncle Peter”, he always has a smile for every\n\n" +
                                  "customer who orders drinks from him, and as\n\n" +
                                  "he is little hard of hearing, do order your kopi\n\n" +
                                  "or teh in Singaporean sign language.", 
                                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center),
                              )
                          ],),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
