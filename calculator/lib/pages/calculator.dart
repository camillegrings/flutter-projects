import 'package:calculator/components/button.dart';
import 'package:calculator/components/viewfinder.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String valueToDisplay = '0';
  String operation = '+';
  int firstValue = 0;
  bool refreshDisplay = false;

  _calculateResult(String value) {
    var result;
    switch (operation) {
      case '+':
        {
          result = firstValue + int.parse(valueToDisplay);
          break;
        }
      case '-':
        {
          result = firstValue - int.parse(valueToDisplay);
          break;
        }
      case 'x':
        {
          result = firstValue * int.parse(valueToDisplay);
          break;
        }
      case '/':
        {
          result = firstValue / int.parse(valueToDisplay);
          break;
        }
    }

    setState(() {
      valueToDisplay = result.toString();
    });
  }

  _operation(String value) {
    setState(() {
      operation = value;
      firstValue = int.parse(valueToDisplay);
      refreshDisplay = true;
    });
  }

  _clean(String value) {
    setState(() {
      valueToDisplay = '0';
      firstValue = 0;
    });
  }

  _update(String value) {
    if (valueToDisplay == '0' || refreshDisplay) {
      setState(() {
        valueToDisplay = value;
      });
    } else {
      var concatValue = '$valueToDisplay$value';
      setState(() {
        valueToDisplay = concatValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Viewfinder(
              value: valueToDisplay,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Button(
                    label: 'AC',
                    color: 'grey',
                    textColor: Colors.black,
                    onTap: _clean,
                  ),
                  Button(label: '+/-', color: 'grey', textColor: Colors.black),
                  Button(label: '%', color: 'grey', textColor: Colors.black),
                  Button(
                    label: '/',
                    color: 'yellow',
                    textColor: Colors.white,
                    onTap: _operation,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Button(label: '7', textColor: Colors.white, onTap: _update),
                  Button(label: '8', textColor: Colors.white, onTap: _update),
                  Button(label: '9', textColor: Colors.white, onTap: _update),
                  Button(
                    label: 'x',
                    color: 'yellow',
                    textColor: Colors.white,
                    onTap: _operation,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Button(label: '4', textColor: Colors.white, onTap: _update),
                  Button(label: '5', textColor: Colors.white, onTap: _update),
                  Button(label: '6', textColor: Colors.white, onTap: _update),
                  Button(
                    label: '-',
                    color: 'yellow',
                    textColor: Colors.white,
                    onTap: _operation,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Button(label: '1', textColor: Colors.white, onTap: _update),
                  Button(label: '2', textColor: Colors.white, onTap: _update),
                  Button(label: '3', textColor: Colors.white, onTap: _update),
                  Button(
                    label: '+',
                    color: 'yellow',
                    textColor: Colors.white,
                    onTap: _operation,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Button(
                      label: '0',
                      textColor: Colors.white,
                      size: 2,
                      isRectangle: true,
                      onTap: _update),
                  Button(label: ',', textColor: Colors.white),
                  Button(
                      label: '=',
                      color: 'yellow',
                      textColor: Colors.white,
                      onTap: _calculateResult)
                ],
              ),
            )
          ],
        ));
  }
}
