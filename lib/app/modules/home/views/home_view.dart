// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hitungongkir/app/modules/home/views/widgets/berat.dart';
import 'package:hitungongkir/app/modules/home/views/widgets/tekstujuan.dart';
import 'package:hitungongkir/app/modules/home/views/widgets/tombol_confirm.dart';
import 'package:http/http.dart' as http;

import '../models/city_model.dart';
import '../models/province_model.dart';

import './widgets/provinsi_awal.dart';
import './widgets/city_awal.dart';
import './widgets/teksasal.dart';

import '../controllers/home_controller.dart';
import 'widgets/city_tujuan.dart';
import 'widgets/kurir.dart';
import 'widgets/provinsi_tujuan.dart';

class HomeView extends GetView<HomeController> {
  String idProvAwal = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        appBar: AppBar(
          title: Text('Raja Ongkir'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextAsal(),
              ProvinsiAwal(),
              SizedBox(height: 10),
              CityAwal(),
              SizedBox(height: 15),
              TextTujuan(),
              ProvinsiTujuan(),
              SizedBox(height: 10),
              CityTujuan(),
              SizedBox(height: 15),
              Berat(),
              SizedBox(height: 10),
              Kurir(),
              SizedBox(height: 10),
              Konfirmasi(),
            ],
          ),
        ));
  }
}
