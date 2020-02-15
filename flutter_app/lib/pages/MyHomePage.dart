import 'package:flutter/material.dart';
import 'package:flutter_app/pages/secondPage.dart';

class MyHomePage extends StatelessWidget {

  _goToSecondScreen( BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text("A"), icon: Icon(Icons.ac_unit)),
          BottomNavigationBarItem(title: Text("B"), icon: Icon(Icons.access_alarm)),
          BottomNavigationBarItem(title: Text("C"), icon: Icon(Icons.account_balance)),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 55),
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
                padding: const EdgeInsets.only(top: 45),
                child: Text(
                  "Hey there,",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  "Where do you want to go today?",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48, bottom: 51),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Bellandur",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Hebbal", border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                  onPressed: () => _goToSecondScreen(context),
                  color: Color.fromRGBO(78, 78, 78, 1),
                  child: Text(
                    "LOOK FOR COMMUTE",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
