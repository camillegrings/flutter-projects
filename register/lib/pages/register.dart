import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  String name, email, number, password, confirmPassword, refCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 90, 30, 0),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                "Register",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 34),
              ),
              Form(
                child: renderForm(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget renderForm() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Full Name",
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(232, 63, 63, 1)))),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Email Address",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(232, 63, 63, 1))),
            ),
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Mobile Number",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(232, 63, 63, 1))),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(232, 63, 63, 1))),
            ),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Confirm Password",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(232, 63, 63, 1))),
            ),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Referal Code (Optional)",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(232, 63, 63, 1))),
            ),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
          ),
        )
      ],
    );
  }
}
