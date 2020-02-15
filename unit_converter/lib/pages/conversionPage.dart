import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/models/unitOption.dart';

class ConversionPage extends StatefulWidget {
  @override
  _ConversionPageState createState() => _ConversionPageState();

  Unit unit;
  Color mainColor;

  ConversionPage({this.unit, this.mainColor});
}

class _ConversionPageState extends State<ConversionPage> {
  UnitOption selectedInput;
  UnitOption selectedOutput;
  var outputField = new TextEditingController();
  String inputValue;

  @override
  void initState() {
    super.initState();

//    UnitOption base =
//        widget.unit.options.firstWhere((option) => option.baseUnit == true);

    setState(() {
      selectedInput = widget.unit.options[0];
      selectedOutput = widget.unit.options[1];
    });
  }

  _chooseAction() {
    if (widget.unit.getFromApi) {
      _convertFromApi();
    } else {
      _convertLocal();
    }
  }

  _convertFromApi() async {
    double firstValue = double.parse(inputValue);
    String firstConversion = selectedInput.name;
    String secondConversion = selectedOutput.name;

    String url =
        "https://flutter.udacity.com/currency/convert?from=$firstConversion&to=$secondConversion&amount=$firstValue";

    final response = await Dio().get(url);
    final data = JsonDecoder().convert(response.data);
    String output;

    if (data['status'] != 'ok') {
      output = 'ERROR';
    } else {
      output = data['conversion'].toString();
    }

    setState(() {
      outputField.text = output;
    });
  }

  _convertLocal() {
    double firstValue = double.parse(inputValue);
    double firstConversion = selectedInput.conversion;
    double secondConversion = selectedOutput.conversion;

    double result = (firstValue * secondConversion) / firstConversion;
    setState(() {
      outputField.text = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.unit.name),
          backgroundColor: widget.mainColor,
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Input",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String newValue) {
                    setState(() {
                      inputValue = newValue;
                    });
                  },
                ),
                Container(
                  height: 30,
                ),
                DropdownButton<UnitOption>(
                  isExpanded: true,
                  value: selectedInput,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (UnitOption newValue) {
                    setState(() {
                      selectedInput = newValue;
                    });
                  },
                  items: widget.unit.options.map((UnitOption unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit.name),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Icon(Icons.import_export),
                ),
                TextFormField(
                  controller: outputField,
                  decoration: InputDecoration(
                    labelText: "Output",
                  ),
                  keyboardType: TextInputType.number,
                ),
                Container(
                  height: 30,
                ),
                DropdownButton<UnitOption>(
                  isExpanded: true,
                  value: selectedOutput,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (UnitOption newValue) {
                    setState(() {
                      selectedOutput = newValue;
                    });
                  },
                  items: widget.unit.options.map((UnitOption unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit.name),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: CupertinoButton(
                    child: Text(
                      "Convert",
                      style: TextStyle(color: widget.mainColor),
                    ),
                    onPressed: _chooseAction,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
