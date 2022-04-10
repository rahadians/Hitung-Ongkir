// To parse this JSON data, do
//
//     final hasilOngkir = hasilOngkirFromJson(jsonString);

import 'dart:convert';

HasilOngkir hasilOngkirFromJson(String str) =>
    HasilOngkir.fromJson(json.decode(str));

String hasilOngkirToJson(HasilOngkir data) => json.encode(data.toJson());

class HasilOngkir {
  HasilOngkir({
    required this.code,
    required this.name,
    required this.costs,
  });

  String code;
  String name;
  List<HasilOngkirCost> costs;

  factory HasilOngkir.fromJson(Map<String, dynamic> json) => HasilOngkir(
        code: json["code"],
        name: json["name"],
        costs: List<HasilOngkirCost>.from(
            json["costs"].map((x) => HasilOngkirCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "costs": List<dynamic>.from(costs.map((x) => x.toJson())),
      };

  static List<HasilOngkir> fromJsonList(List list) {
    if (list == null) return List<HasilOngkir>.empty();
    return list.map((item) => HasilOngkir.fromJson(item)).toList();
  }
}

class HasilOngkirCost {
  HasilOngkirCost({
    required this.service,
    required this.description,
    required this.cost,
  });

  String service;
  String description;
  List<CostCost> cost;

  factory HasilOngkirCost.fromJson(Map<String, dynamic> json) =>
      HasilOngkirCost(
        service: json["service"],
        description: json["description"],
        cost:
            List<CostCost>.from(json["cost"].map((x) => CostCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service": service,
        "description": description,
        "cost": List<dynamic>.from(cost.map((x) => x.toJson())),
      };

  static List<HasilOngkirCost> fromJsonList(List list) {
    if (list == null) return List<HasilOngkirCost>.empty();
    return list.map((item) => HasilOngkirCost.fromJson(item)).toList();
  }
}

class CostCost {
  CostCost({
    required this.value,
    required this.etd,
    required this.note,
  });

  int value;
  String etd;
  String note;

  factory CostCost.fromJson(Map<String, dynamic> json) => CostCost(
        value: json["value"],
        etd: json["etd"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "etd": etd,
        "note": note,
      };

  static List<CostCost> fromJsonList(List list) {
    if (list == null) return List<CostCost>.empty();
    return list.map((item) => CostCost.fromJson(item)).toList();
  }
}
