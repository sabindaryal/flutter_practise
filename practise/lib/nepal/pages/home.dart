import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practise/nepal/modal/provinceModal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProvinceModal> provinceData = [];

  // final List<ProvinceModal> districData = [];
  Future<List<ProvinceModal>> getProvinceData() async {
    try {
      // List<ProvinceModal> produkte = [];
      var token = 'TPj7zvDMLG';
      final response = await http.get(
        Uri.parse('https://nepallocation.com.np/api/v1/province/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        provinceData.clear();
        final apidata = [json.decode(response.body)['data']];

        for (var provinceinfo in apidata) {
          provinceData.add(ProvinceModal.fromJson(provinceinfo));
        }
        print(provinceData);
        // produkte = apidata
        //     .map((i) => ProvinceModal.fromJson(Map<String, dynamic>.from(i)))
        //     .toList();
        // print(produkte);

        // provinceData = provinceapidata['data']
        //     .map((value) => ProvinceModal.fromJson(value))
        //     .toList();
      }

      return provinceData;
    } catch (error) {
      print(error);
      return provinceData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getProvinceData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provinceData.length,
                      itemBuilder: (context, index) {
                        var data = provinceData[index];
                        return Card(
                          child: Column(
                            children: [
                              Text(data.name),
                              // ListView.builder(
                              //     shrinkWrap: true,
                              //     physics: const NeverScrollableScrollPhysics(),
                              //     // itemCount: data.districts.length,
                              //     itemCount: data.districts.length,
                              //     itemBuilder: (context, index) {
                              //       var districtsData = data.districts[index];
                              //       //  var districtsData = data.districts[index];
                              //       return Text(districtsData.name);
                              //     })
                            ],
                          ),
                        );
                      });
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
