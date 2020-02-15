class UnitOption {
  String name;
  double conversion;
  bool baseUnit;

  UnitOption.fromJSON(Map json)
      : name = json['name'],
        conversion = json['conversion'].toDouble(),
        baseUnit = json['base_unit'];

}
