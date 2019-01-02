import 'package:flutter/material.dart';

import 'package:quiver/core.dart';

import 'package:makerthon2018/model/modifier.dart';

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
    return new ListView.builder(
      itemCount: _availableOptions.length, 
      itemBuilder: (context, index) => new Container(
        height: 100,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
        child: new InkWell(
          child: Row(
            children: <Widget>[
              // AspectRatio(
              //   aspectRatio: 1,
              //   child: Image.asset(_availableOptions[index].icon,
              //     fit: BoxFit.fitWidth,
              //   )
              // ),
              Container(
                constraints: BoxConstraints.tightFor(width: MediaQuery.of(context).size.width/2 - 44),
                color: (_availableOptions.elementAt(index) == _selectedModifier) ? 
                  Colors.orange : Color.fromRGBO(150, 150, 150, 1),
                child: Center(
                  child: Text(_availableOptions[index].name, style: TextStyle(color: Colors.white, fontSize: 20.0)),
                ))]),
          onTap: () {
            setState(() {
              this._selectedModifier = _availableOptions[index];
            });
          })));
  }
}