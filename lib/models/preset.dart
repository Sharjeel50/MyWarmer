import 'dart:convert';

Preset presetFromJson(String str) => Preset.fromJson(json.decode(str));

String userToJson(Preset data) => json.encode(data.toJson());

class Preset {
  String name;
  double temperature;

  Preset({
    this.name,
    this.temperature,
  });

  factory Preset.fromJson(Map<String, dynamic> json) =>
      Preset(name: json['name'], temperature: json['temperature']);

  Map<String, dynamic> toJson() => {'name': name, 'temperature': temperature};
}
