import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 35, 30, 0),
        child: Row(
          children: <Widget>[
            Text(
              "Playlist",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.account_circle, size: 35,)
          ],
        ),
      ),
    );
  }
}
