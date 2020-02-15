import 'package:flutter/material.dart';

class Songs extends StatelessWidget {
  String title;
  String singer;
  bool isPlaying;

  Songs({this.title, this.singer, this.isPlaying});

  _renderIcon() {
    if (isPlaying) {
      return Icon(
        Icons.pause_circle_outline,
        size: 35,
        color: Color.fromRGBO(255, 64, 96, 1),
      );
    }
    return Container();
  }

  _chooseColor() {
    if (isPlaying) return Color.fromRGBO(255, 64, 96, 1);
    return Color.fromRGBO(51, 51, 51, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(151, 151, 151, 0.1)))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: _chooseColor()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Text(
                      singer,
                      style: TextStyle(fontSize: 15, color: _chooseColor()),
                    ),
                  )
                ],
              ),
              Spacer(),
              _renderIcon()
            ],
          ),
        ),
      ),
    );
  }
}
