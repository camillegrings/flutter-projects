import 'package:unit_converter/models/unitOption.dart';

class Unit {
  String name;
  List<UnitOption> options;
  bool getFromApi;

  Unit({this.name, this.options, this.getFromApi});

}