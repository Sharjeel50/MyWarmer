import 'dart:convert';

Preset presetFromJson(String str) => Preset.fromJson(json.decode(str));
String userToJson(Preset data) => json.encode(data.toJson());

class Preset {
  String name;
  double temp;
  DateTime datetime;

  Preset({
    this.name,
    this.temp,
    this.datetime
  });

  factory Preset.fromJson(Map<String, dynamic> json) => Preset(
    name: json['name'],
    temp: json['temp'],
    datetime: json['datetime']
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'temp': temp,
    'datetime': datetime
  };

}