import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 59, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.sort,
                    size: 30,
                  ),
                  Spacer(),
                  Icon(
                    Icons.list,
                    size: 30,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 46, bottom: 40),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Bellandur to",
                      style: TextStyle(fontSize: 24, color: Colors.black87),
                    ),
                    Text(
                      "Nandi Hills",
                      style: TextStyle(fontSize: 24, color: Colors.black87),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
