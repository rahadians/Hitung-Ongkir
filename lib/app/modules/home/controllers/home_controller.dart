import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hitungongkir/app/modules/home/views/widgets/kurir.dart';

class HomeController extends GetxController {
  RxString provAwalid = "".obs;
  RxString cityAwalid = "".obs;
  RxString provTujuanid = "".obs;
  RxString cityTujuanid = "".obs;
  RxDouble berat = 0.0.obs;
  RxString satuan = "gram".obs;
  RxBool hiddenButton = true.obs;
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

  void showButton() {
    if (cityAwalid != 0 && cityTujuanid != 0 && berat > 0 && Kurir != "") {
      hiddenButton.value = false;
    } else {
      hiddenButton.value = true;
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
