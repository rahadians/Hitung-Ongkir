// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  Province({
    required this.provinceId,
    required this.province, cityid, cityName,
  });

  String provinceId;
  String province;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        provinceId: json["province_id"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "province_id": provinceId,
        "province": province,
      };

  static List<Province> fromJsonList(List list) {
    if (list == null) return List<Province>.empty();
    return list.map((item) => Province.fromJson(item)).toList();
  }
}
