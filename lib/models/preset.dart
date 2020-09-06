import 'dart:convert';

Preset presetFromJson(String str) => Preset.fromJson(json.decode(str));

String userToJson(Preset data) => json.encode(data.toJson());

class Preset {
  String name;
  double temp;

  Preset({
    this.name,
    this.temp,
  });

  factory Preset.fromJson(Map<String, dynamic> json) =>
      Preset(name: json['name'], temp: json['temp']);

  Map<String, dynamic> toJson() => {'name': name, 'temp': temp};
}
