import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../controllers/home_controller.dart';
import '../../models/province_model.dart';

class ProvinsiTujuan extends GetView<HomeController> {
  const ProvinsiTujuan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Province>(
      mode: Mode.MENU,
      showClearButton: true,
      showSearchBox: true,
      dropdownSearchDecoration: InputDecoration(
          labelText: "Province Tujuan",
          contentPadding: EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 15,
          ),
          border: OutlineInputBorder()),
      onFind: (dynamic filter) async {
        try {
          Uri url = Uri.parse("https://api.rajaongkir.com/starter/province");

          var response = await http
              .get(url, headers: {"key": "428084606cd44a1724aaf7b2c83de401"});

          if (response.statusCode == 200) {
            List allProvince = (json.decode(response.body)
                as Map<String, dynamic>)["rajaongkir"]["results"];

            List<Province> allModelProvince = [];

            allProvince.forEach(
              (element) {
                allModelProvince.add(Province(
                    provinceId: element["province_id"],
                    province: element["province"]));
              },
            );

            return allModelProvince;

            // setState(() {});
          } else {
            // print("Data tidak ada");
            return [];
          }
        } catch (err) {
          print(err);

          return List<Province>.empty();
        }
      },
      popupItemBuilder: (context, item, isSelected) => ListTile(
        //ini adalah tampilan di dropdown apakah kode atau nama
        title: Text(item.province),
      ),
      dropdownBuilder:
          (context, selectedItem) => // ini adalah tampilan di Tujuan combo box
              Text(selectedItem?.province ?? "Belum Mimilih Provinsi"),
      itemAsString: (item) => item!.province, //ini agar saat search terbaca
      onChanged: (value) {
        if (value == null) {
          // print("Tidak Memilih Apapun");

          controller.provTujuanid.value = "Belum Mimilih Provinsi";
        } else {
          controller.provTujuanid.value = value.provinceId;
          // print(controller.proTujuanid.value);
        }
      },
    );
  }
}
