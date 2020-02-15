import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String label;
  String color;
  Color textColor;
  Function onTap;
  int size;
  bool isRectangle;

  Button(
      {this.label,
      this.color,
      this.textColor,
      this.onTap,
      this.size = 1,
      this.isRectangle = false});

  _getColor() {
    switch (color) {
      case 'grey':
        return Color.fromRGBO(175, 175, 175, 1);
      case 'yellow':
        return Color.fromRGBO(255, 149, 0, 1);
      default:
        return Color.fromRGBO(51, 51, 51, 1);
    }
  }

  _renderDecoration() {
    if (isRectangle) {
      return BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(90.0)),
          color: _getColor());
    }

    return BoxDecoration(
      shape: BoxShape.circle,
      color: _getColor(),
    );
  }

  _getContentPadding() {
    if (isRectangle) return const EdgeInsets.fromLTRB(8, 15, 8, 15);
    return const EdgeInsets.fromLTRB(8, 0, 8, 0);
  }

  _getAligment() {
    if (isRectangle) return Alignment.centerLeft;
    return Alignment.center;
  }

  _getTextPadding() {
    if (isRectangle) return const EdgeInsets.only(left: 30);
    return const EdgeInsets.only(left: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: size,
      child: Padding(
        padding: _getContentPadding(),
        child: InkWell(
          onTap: () {
            onTap(label);
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: _renderDecoration(),
            child: Align(
                alignment: _getAligment(),
                child: Padding(
                  padding: _getTextPadding(),
                  child: Text(
                    label,
                    style: TextStyle(color: textColor, fontSize: 36),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
