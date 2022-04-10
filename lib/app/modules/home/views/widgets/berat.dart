import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitungongkir/app/modules/home/controllers/home_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Berat extends GetView<HomeController> {
  const Berat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller.beratC,
            autocorrect: false,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: "Berat Barang",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => controller.ubahBerat(value),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 120,
          child: DropdownSearch<String>(
            mode: Mode.BOTTOM_SHEET,
            showSelectedItems: true,
            showSearchBox: true,
            dropdownSearchDecoration: InputDecoration(
              fillColor: Colors.amber,

              // label: Text("--Satuan--"),
              border: OutlineInputBorder(),
            ),
            items: [
              "ton",
              "kwital",
              "ons",
              "lbs",
              "pound",
              "kg",
              "hg",
              "dag",
              "gram",
              "dg",
              "cg",
              "mg",
            ],
            onChanged: (value) => controller.ubahSatuan(value!),
            selectedItem: "gram",
          ),
        )
      ],
    );
  }
}
