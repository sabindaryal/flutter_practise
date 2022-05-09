import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practise/memeapiget/mememodal.dart';

class memePage extends StatefulWidget {
  const memePage({Key? key}) : super(key: key);

  @override
  State<memePage> createState() => _memePageState();
}

List<MemeElement> memeData = [];

Future<List<MemeElement>> getMeme() async {
  final response =
      await http.get(Uri.parse('https://api.imgflip.com/get_memes'));

  var data = jsonDecode(response.body)['data']['memes'];
  if (response.statusCode == 200) {
    for (var info in data) {
      memeData.add(MemeElement.fromJson(info));
    }
    return memeData;
  } else {
    return memeData;
  }
}

class _memePageState extends State<memePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('MEME')),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: getMeme(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: memeData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(memeData[index].name),
                        Image(
                            image: NetworkImage(memeData[index].url, scale: 2)),
                      ],
                    ),
                  );
                });
          }
        },
      )),
    );
  }
}
