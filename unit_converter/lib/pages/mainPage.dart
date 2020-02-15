import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/models/unitOption.dart';
import 'package:unit_converter/pages/conversionPage.dart';
import 'package:unit_converter/uiComponents/cardRow.dart';

const _baseColors = <Color>[
  Colors.teal,
  Colors.orange,
  Colors.pinkAccent,
  Colors.blueAccent,
  Colors.amber,
  Colors.green,
  Colors.purpleAccent,
  Colors.red,
];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Unit> units = [];

  _goToConversionPage(BuildContext context, Unit unit, Color mainColor) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ConversionPage(unit: unit, mainColor: mainColor)));
  }

  _getData(BuildContext context) async {
    final json = await DefaultAssetBundle.of(context)
        .loadString("assets/data/regular_units.json");
    final data = JsonDecoder().convert(json);
    List<Unit> _units = [];

    data.forEach((key, value) {
      List<UnitOption> options = [];

      value.forEach((key) {
        var option = UnitOption.fromJSON(key);
        options.add(option);
      });

      var unit = Unit(name: key, options: options, getFromApi: false);
      _units.add(unit);
    });

    final currencyResponse =
        await Dio().get("https://flutter.udacity.com/currency");
    final currencyData = JsonDecoder().convert(currencyResponse.data);

    List<UnitOption> options = [];

    currencyData['units'].forEach((key) {
      var option = UnitOption.fromJSON(key);
      options.add(option);
    });

    var unit = Unit(name: "Currency", options: options, getFromApi: true);
    _units.add(unit);

    setState(() {
      units = _units;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData(context);
  }

  @override
  Widget build(BuildContext context) {
    if (units == null) return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit Converter"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: units.length,
            itemBuilder: (BuildContext context, int index) {
              Color color = _baseColors[index];
              return CardRow(
                label: units[index].name,
                color: color,
                imageName: units[index].name.toLowerCase().replaceAll(' ', '_'),
                onTap: () {
                  _goToConversionPage(context, units[index], color);
                },
              );
            }),
      ),
    );
  }
}
