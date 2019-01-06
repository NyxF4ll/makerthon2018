import 'package:flutter/material.dart';

import 'package:makerthon2018/app_navigator.dart';
import 'package:makerthon2018/model/menu.dart';
import 'package:makerthon2018/model/order.dart';
import 'package:makerthon2018/view/customization_menu_widget.dart';
import 'package:makerthon2018/view/video_display_view.dart';

class OrderCustomizationView extends StatefulWidget {

  final Order _order;
  
  OrderCustomizationView(this._order);

  @override
  State<StatefulWidget> createState() => _OrderCustomizationViewState(_order);

}

class _OrderCustomizationViewState extends State<OrderCustomizationView> {

  final Order _order;

  CustomizationMenuWidget temperatureWidget = CustomizationMenuWidget(TEMP, "Temperature");
  CustomizationMenuWidget sweetnessWidget = CustomizationMenuWidget(SWEETNESS, "Sugar Level");
  CustomizationMenuWidget thicknessWidget = CustomizationMenuWidget(THICKNESS, "Intensity");

  _OrderCustomizationViewState(this._order);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    
    var getAssembledOrder = () => _order.withModifiers(
      [
        temperatureWidget.modifier, 
        sweetnessWidget.modifier, 
        thicknessWidget.modifier
      ]
    );

    var getAssembledVideo = () => getAssembledOrder.call().videos;


    var mainImage = Image.asset(
      _order.image,
      height: screenHeight,
      fit: BoxFit.fitHeight,
    );

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('Customisations'),
        centerTitle: false,
      ),

      body: Center(
        child: Container(
          color: Color.fromRGBO(240, 240, 240, 1),
          height: screenHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: <Widget>[
                    Container(),

                    temperatureWidget,

                    sweetnessWidget,

                    thicknessWidget,

                    Container()
                  ]
                ),
                width: screenWidth/2 + 78,
              ),
              Container(
                width: screenWidth/2 - 78,
                child: Column(
                  children: <Widget>[
                    VideoDisplayView(getAssembledVideo),
                    Container(
                      child: new Row(children: <Widget>[
                        InkWell(
                          child: Container(
                            color: Colors.lime[600],
                            alignment: Alignment.center,
                            height: 80,
                            width: screenWidth / 2 - 182,
                            child: Text("Notify Seller",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ),
                          onTap: () async {
                            return;
                          }, 
                        ),
                        Container(
                          width: 4,
                          color: Colors.black87,
                        ),
                        InkWell(
                          child: Container(
                            color: Colors.lime[600],
                            height: 80,
                            width: 100,
                            child: Icon(Icons.close, color: Colors.white, size: 45)  
                          ),
                          onTap: () => AppNavigator.of(context).returnToMenu(), 
                        ),
                      ]),
                      height: 80,
                    )
                  ],
                )
              ),
            ]
          )
        ),
      ),
    );
  }
}