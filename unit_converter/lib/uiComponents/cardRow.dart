import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  String label;
  String imageName;
  Color color;
  Function onTap;

  CardRow({@required this.label, @required this.imageName, @required this.color, @required this.onTap})
      : assert(label != null, imageName != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: color,
      splashColor: color,
      child: Container(
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/icons/" + imageName + ".png"),
              ),
              Text(
                label,
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
