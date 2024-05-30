// To parse this JSON data, do
//
//     final getLocationResponse = getLocationResponseFromJson(jsonString);

import 'dart:convert';

List<GetLocationResponse> getLocationResponseFromJson(String str) => List<GetLocationResponse>.from(json.decode(str).map((x) => GetLocationResponse.fromJson(x)));

String getLocationResponseToJson(List<GetLocationResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetLocationResponse {
  String? name;
  Map<String, String>? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  GetLocationResponse({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  factory GetLocationResponse.fromJson(Map<String, dynamic> json) => GetLocationResponse(
    name: json["name"],
    localNames: Map.from(json["local_names"]!).map((k, v) => MapEntry<String, String>(k, v)),
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "local_names": Map.from(localNames!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "lat": lat,
    "lon": lon,
    "country": country,
    "state": state,
  };
}
