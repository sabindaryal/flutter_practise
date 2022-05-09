import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practise/withoutmodel/passing.dart';

class noModel extends StatefulWidget {
  const noModel({Key? key}) : super(key: key);

  @override
  State<noModel> createState() => _noModelState();
}

class _noModelState extends State<noModel> {
  late List data;
  Future<void> getApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('get'))),
      body: SafeArea(
          child: FutureBuilder(
        future: getApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print('working');
            return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                    children: [
                      Text(data[index]['username'].toString()),
                      PassingPage(title: 'name', value: data[index]['name']!),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.push(context,
                      //           MaterialPageRoute(builder: (context) {
                      //         return PassingPage(
                      //             title: 'name',
                      //             value: data[index]['name'].toString());
                      //       }));
                      //     },
                      //     child: const Text('pass')),
                    ],
                  ));
                });
          }
        },
      )),
    );
  }
}
