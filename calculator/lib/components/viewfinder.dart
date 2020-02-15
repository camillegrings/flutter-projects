import 'package:flutter/material.dart';

class Viewfinder extends StatelessWidget {
  String value;

  Viewfinder({this.value = '0'});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 94),
            ),
          ),
        ),
      ),
    );
  }

}

