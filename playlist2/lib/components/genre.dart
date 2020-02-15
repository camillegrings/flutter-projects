import 'package:flutter/material.dart';

class Genre extends StatelessWidget {
  String name;
  bool isSelected;
  Function onTap;

  Genre({this.name, this.isSelected, this.onTap});

  _chooseColor() {
    if (isSelected) return Color.fromRGBO(255, 64, 96, 1);
    return Color.fromRGBO(255, 240, 242, 1);
  }

  _chooseTextStyle() {
    if (isSelected)
      return TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
    return TextStyle(fontSize: 20, color: Color.fromRGBO(255, 64, 96, 1));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 95,
          height: 95,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _chooseColor(),
          ),
          child: Center(
              child: Text(
            name,
            style: _chooseTextStyle(),
          )),
        ),
      ),
    );
  }
}
