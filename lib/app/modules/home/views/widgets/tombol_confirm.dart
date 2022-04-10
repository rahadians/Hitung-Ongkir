import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitungongkir/app/data/datakurir.dart';

import 'package:http/http.dart' as http;

import '../../controllers/home_controller.dart';
import '../../models/city_model.dart';

class Konfirmasi extends GetView<HomeController> {
  const Konfirmasi({
    Key? key,
  }) : super(key: key);
// Map<String, dynamic>
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => controller.HitungOngkir(),
        child: Text("Hitung Ongkir"));
  }
  //   if ((controller.hiddenButton.value)) {
  //     return SizedBox(
  //       height: 10,
  //     );
  //   } else {
  //     return ElevatedButton(
  //         onPressed: () => controller.HitungOngkir(), child: Text("Confirm"));
  //   }
  // }
}
