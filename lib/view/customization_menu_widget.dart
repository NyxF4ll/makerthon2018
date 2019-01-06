import 'package:flutter/material.dart';


import 'package:makerthon2018/model/modifier.dart';

class CustomizationMenuWidget extends StatefulWidget {
  
  final List<Modifier> _availableOptions;
  final String _optionName;
  final _CustomizationMenuWidgetState state;

  CustomizationMenuWidget(this._availableOptions, this._optionName): state = _CustomizationMenuWidgetState(_availableOptions, _optionName);

  Modifier get modifier => state._selectedModifier;

  @override
  State<StatefulWidget> createState() => state;
}

class _CustomizationMenuWidgetState extends State<CustomizationMenuWidget> {

  final String _optionName;
  final List<Modifier> _availableOptions;
  Modifier _selectedModifier;

  _CustomizationMenuWidgetState(this._availableOptions, this._optionName) {
    _selectedModifier = _availableOptions[0];
    _availableOptions
      .where((option) => option.video == null)
      .forEach((option) => _selectedModifier = option);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;

    return Container(
      width: screenWidth / 2 + 78,
      padding: EdgeInsets.fromLTRB(20,0,20,0),
      child: new Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              height: 200,
              color: Colors.black87,
              alignment: Alignment.center,
              child: Text(
                _optionName,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: 120,
              width: screenWidth / 2 - 120,
              child: Row(
                children: _availableOptions.map((option) => InkWell(
                  child: AspectRatio(

                    aspectRatio: 1.0,
                    child: Image.asset(
                      option.icon,
                      fit: BoxFit.fitHeight,
                      color: (option == _selectedModifier) ? Colors.white : Colors.grey,
                      colorBlendMode: (option == _selectedModifier) ? BlendMode.dst : BlendMode.srcIn,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      this._selectedModifier = option;
                    });
                  },
                )).toList(),
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            )
          ],
        ),
      ),
    );
  }
}
