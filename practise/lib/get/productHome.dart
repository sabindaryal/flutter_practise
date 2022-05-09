import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practise/get/modal.dart';
import 'package:http/http.dart' as http;
import 'package:practise/get/productPage.dart';

class productHome extends StatefulWidget {
  const productHome({Key? key}) : super(key: key);

  @override
  State<productHome> createState() => _productHomeState();
}

class _productHomeState extends State<productHome> {
  List<Products> detial = [];
  Future getProductData() async {
    // print("hello");
    detial = [];

    var res = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2022-04-02&sortBy=publishedAt&apiKey=0ecf3c3323c64559840400df0f9dc5c1'));

    final data = jsonDecode(res.body)['data'];

    for (var info in data) {
      detial.add(Products.fromJson(info));
    }

    return (detial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            //      SafeArea(
            //   child: Column(children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           getProductData();
            //         },
            //         child: Text('get'))
            //   ]),
            // ));
            SafeArea(
                child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: getProductData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300, childAspectRatio: 0.7),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return productPage(
                          des: snapshot.data[1].des,
                          price: snapshot.data[1].price,
                          name: snapshot.data[1].fullName,
                        );
                      })));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          // Image(
                          //   image: NetworkImage(snapshot.data[index].image),
                          //   height: 150,
                          // ),
                          Text("Name:" + snapshot.data[index].fullName),
                          Flexible(
                              child:
                                  Text("Name:" + snapshot.data[index].price)),
                          Flexible(
                              child: Text("Email:" + snapshot.data[index].des)),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text('wrong'),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    )));
  }
}
