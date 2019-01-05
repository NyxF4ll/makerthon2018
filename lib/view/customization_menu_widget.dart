import 'package:flutter/material.dart';

import 'package:quiver/core.dart';

import 'package:makerthon2018/model/modifier.dart';

import 'package:makerthon2018/model/menu.dart';

class CustomizationMenuWidget extends StatefulWidget {
  
  final List<Modifier> _availableOptions;
  _CustomizationMenuWidgetState state;

  CustomizationMenuWidget(this._availableOptions);

  Modifier get modifier => state._selectedModifier;

  @override
  State<StatefulWidget> createState(){
    state = _CustomizationMenuWidgetState(_availableOptions);
    return state;
  }
}

class _CustomizationMenuWidgetState extends State<CustomizationMenuWidget> {

  final List<Modifier> _availableOptions;
  Modifier _selectedModifier;

  _CustomizationMenuWidgetState(this._availableOptions) {
    _selectedModifier = _availableOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    return new GridView.builder(
      itemCount: _availableOptions.length, 
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _availableOptions.length,
        crossAxisSpacing: 10,
        childAspectRatio: 1),
      itemBuilder: (context, index) => new Container(
        height: 100,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: new InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(_availableOptions[index].icon,
                  height: 20,
                  color: Colors.grey,
                  colorBlendMode:  
                    (_availableOptions.elementAt(index) == _selectedModifier) ? 
                      BlendMode.overlay : BlendMode.lighten
                )
              ),
              ]),
          onTap: () {
            setState(() {
              this._selectedModifier = _availableOptions[index];
            });
          })));
  }
}
