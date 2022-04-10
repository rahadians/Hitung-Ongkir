import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitungongkir/app/data/datakurir.dart';

import 'package:http/http.dart' as http;

import '../../controllers/home_controller.dart';
import '../../models/city_model.dart';

class Kurir extends GetView<HomeController> {
  const Kurir({
    Key? key,
  }) : super(key: key);
// Map<String, dynamic>
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Map<String, dynamic>>(
      mode: Mode.BOTTOM_SHEET,
      items: DataKurir,
      showClearButton: true,
      dropdownSearchDecoration: InputDecoration(
        hintText: "--Pilih Kurir--",
      ),
      popupItemBuilder: (context, item, isSelected) => ListTile(
        //ini adalah tampilan di dropdown apakah kode atau nama
        title: Text(
          "${item['name']}",
        ),
      ),
      dropdownBuilder:
          (context, selectedItem) => // ini adalah tampilan di Tujuan combo box
              Text(selectedItem?['name'] ?? "---PILIH KURIR---"),
      // print(DataKurir as List);
      itemAsString: (item) => item!['name'], //ini agar saat search terbaca,

      onChanged: (value) {
        if (value != null) {
          controller.kurir.value = value["code"];
          controller.showButton();
        } else {
          controller.hiddenButton.value = true;
          controller.kurir.value = "";
        }
      },
    );
  }
}
