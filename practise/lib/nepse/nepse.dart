import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practise/nepse/nepsemodal.dart';
import 'package:http/http.dart' as http;
import 'package:practise/nepse/searchbar.dart';
import 'package:practise/nepse/stockpage.dart';

class nepsePage extends StatefulWidget {
  const nepsePage({Key? key}) : super(key: key);

  @override
  State<nepsePage> createState() => _nepsePageState();
}

class _nepsePageState extends State<nepsePage> {
  List<LiveDatum> NepseData = [];

  Future<List<LiveDatum>> getMeme() async {
    final response =
        await http.get(Uri.parse('https://live.nepse.repl.co/api.php'));

    var data = jsonDecode(response.body)['live_data'];

    if (response.statusCode == 200) {
      NepseData.clear();
      for (var info in data) {
        NepseData.add(LiveDatum.fromJson(info));
      }

      return NepseData;
    } else {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'NEPSE',
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(NepseData),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ]
          ),
      body: SafeArea(
          child: FutureBuilder(
        future: getMeme(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: NepseData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return stockPage(
                            stockname: NepseData[index].fullName,
                            ltp: NepseData[index].ltp,
                            ltv: NepseData[index].ltv.toString(),
                            symbol: NepseData[index].symbol,
                            fullName: NepseData[index].fullName,
                            percentChange:
                                NepseData[index].percentChange.toString(),
                            high: NepseData[index].high.toString(),
                            low: NepseData[index].low.toString(),
                            open: NepseData[index].open.toString(),
                            qty: NepseData[index].qty.toString(),
                            previousClose: NepseData[index].previousClose,
                            stockinfo: NepseData[index].toString(),
                          );
                        })));
                      },
                      child: Card(
                        color: Colors.grey[700],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    NepseData[index].fullName,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      )),
    );
  }
}
