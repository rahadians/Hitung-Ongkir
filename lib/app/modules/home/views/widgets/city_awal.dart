import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../controllers/home_controller.dart';
import '../../models/city_model.dart';

class CityAwal extends GetView<HomeController> {
  const CityAwal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<City>(
      mode: Mode.MENU,
      showClearButton: true,
      showSearchBox: true,
      dropdownSearchDecoration: InputDecoration(
          labelText: "City Awal",
          contentPadding: EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 15,
          ),
          border: OutlineInputBorder()),
      onFind: (dynamic filter) async {
        try {
          Uri url = Uri.parse(
              "https://api.rajaongkir.com/starter/city?province=${controller.provAwalid}");

          var response = await http
              .get(url, headers: {"key": "428084606cd44a1724aaf7b2c83de401"});

          if (response.statusCode == 200) {
            List allCity = (json.decode(response.body)
                as Map<String, dynamic>)["rajaongkir"]["results"];

            List<City> allModelCity = [];

            allCity.forEach(
              (element) {
                allModelCity.add(City(
                    cityId: element["city_id"],
                    cityName: element["city_name"],
                    type: element["type"]));
              },
            );

            return allModelCity;

            // setState(() {});
          } else {
            print("Data tidak ada");
            return [];
          }
        } catch (err) {
          print(err);

          return List<City>.empty();
        }
      },
      popupItemBuilder: (context, item, isSelected) => ListTile(
        //ini adalah tampilan di dropdown apakah kode atau nama
        title: Text("${item.type} ${item.cityName!}"),
      ),

      // dropdownBuilder:
      //     (context, selectedItem) => // ini adalah tampilan di awal combo box

      //         Text((selectedItem?.cityId && selectedItem?.cityId)!  ?? "Belum Mimilih Provinsi",),

      itemAsString: (item) =>
          "${item?.type!} ${item?.cityName!}", //ini agar saat search terbaca

      onChanged: (value) {
        if (value == null) {
          // print("Tidak Memilih Apapun");

          controller.cityAwalid.value = "Tidak Memilih Apapun";
        } else {
          controller.cityAwalid.value = value.cityId!;
          // print(controller.cityAwalid.value);
        }
      },
    );
  }
}
