import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitungongkir/app/data/datakurir.dart';
import 'package:hitungongkir/app/modules/home/models/hasil_ongkir.dart';
import 'package:hitungongkir/app/modules/home/models/province_model.dart';
import 'package:hitungongkir/app/modules/home/views/widgets/kurir.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxString provAwalid = "".obs;
  RxString cityAwalid = "".obs;
  RxString provTujuanid = "".obs;
  RxString cityTujuanid = "".obs;
  RxDouble berat = 0.0.obs;
  RxString satuan = "kg".obs;
  // RxBool hiddenButton = true.obs;
  RxString kurir = "".obs;

  late TextEditingController beratC;

  void ubahBerat(String value) {
    berat.value = double.tryParse(value) ?? 0.00;

    String cekSatuan = satuan.value;

    switch (cekSatuan) {
      case "ton":
        berat.value = berat.value * 1000000;
        break;
      case "kwintal":
        berat.value = berat.value * 100000;
        break;
      case "ons":
        berat.value = berat.value * 100;
        break;
      case "lbs":
        berat.value = berat.value * 2204.62;
        break;
      case "pound":
        berat.value = berat.value * 2204.62;
        break;
      case "kg":
        berat.value = berat.value * 1000;
        break;
      case "hg":
        berat.value = berat.value * 100;
        break;
      case "dag":
        berat.value = berat.value * 10;
        break;
      case "gram":
        berat.value = berat.value * 1;
        break;
      case "dg":
        berat.value = berat.value * 0.1;
        break;
      case "cg":
        berat.value = berat.value * 0.01;
        break;
      case "mg":
        berat.value = berat.value * 0.001;
        break;

      default:
        berat.value = berat.value;
    }

    print("${berat.value} gram");
  }

  void ubahSatuan(String value) {
    berat.value = double.tryParse(beratC.text) ?? 0.00;
    switch (value) {
      case "ton":
        berat.value = berat.value * 1000000;
        break;
      case "kwintal":
        berat.value = berat.value * 100000;
        break;
      case "ons":
        berat.value = berat.value * 100;
        break;
      case "lbs":
        berat.value = berat.value * 2204.62;
        break;
      case "pound":
        berat.value = berat.value * 2204.62;
        break;
      case "kg":
        berat.value = berat.value * 1000;
        break;
      case "hg":
        berat.value = berat.value * 100;
        break;
      case "dag":
        berat.value = berat.value * 10;
        break;
      case "gram":
        berat.value = berat.value * 1;
        break;
      case "dg":
        berat.value = berat.value * 0.1;
        break;
      case "cg":
        berat.value = berat.value * 0.01;
        break;
      case "mg":
        berat.value = berat.value * 0.001;
        break;

      default:
        berat.value = berat.value;
    }
    satuan.value = value;

    print("${berat.value}");
  }

  // void showButton() {
  //   if (cityAwalid != 0 && cityTujuanid != 0 && berat > 0 && Kurir != "") {
  //     hiddenButton.value = false;
  //   } else {
  //     hiddenButton.value = true;
  //   }
  // }

  void HitungOngkir() async {
    Uri url = Uri.parse("https://api.rajaongkir.com/starter/cost");
    try {
      final Response = await http.post(
        url,
        body: {
          "origin": cityAwalid.value,
          "destination": cityTujuanid.value,
          "weight": berat.value.toString(),
          "courier": kurir.value
          // "origin": "501",
          // "destination": "114",
          // "weight": "1700",
          // "courier": "jne"
        },
        headers: {
          "key": "428084606cd44a1724aaf7b2c83de401",
          "content-type": "application/x-www-form-urlencoded",
        },
      );
      print((Response != null) ? "ada data" : "tidak ada data");
      var hasil = json.decode(Response.body) as Map<String, dynamic>;

      var results = hasil['rajaongkir']['results'] as List<dynamic>;

      var listAllHasilKurir = HasilOngkir.fromJsonList(results);
      var courier = listAllHasilKurir[0];

      Get.defaultDialog(
          content: Column(
              children: courier.costs
                  .map((e) => ListTile(
                        title: Text("${e.service}"),
                        subtitle: Text(" Rp. ${e.cost[0].value}"),
                        trailing: Text("${e.cost[0].etd} hari"),
                      ))
                  .toList()));
    } catch (err) {
      print("error bro");
    }
  }

  //TODO: Implement HomeController

  // final count = 0.obs;
  @override
  void onInit() {
    beratC = TextEditingController();
    bool hiddenButton = false;
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  void onClose() {
    beratC.dispose();
  }
  // void increment() => count.value++;
}
