import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practise/postgetdelet/modal.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

Future<Album> sendData(String title, body) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'body': body,
    }),
  );

  if (response.statusCode == 201) {
    print('send');
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('error in status code');
  }
}

Future<Album>? _futureAlbum;

class _homePageState extends State<homePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllers = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AlertDialog(
          title: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: 'Enter Title'),
                ),
                TextField(
                  controller: _controllers,
                  decoration: const InputDecoration(hintText: 'Enter Title'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _futureAlbum =
                          sendData(_controller.text, _controllers.text);
                      // _futureAlbum = sendData(_controllers.text);
                    });
                  },
                  child: const Text('Create Data'),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300, childAspectRatio: 0.7),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Text(snapshot.data!.title),
                          Text(snapshot.data!.body),
                        ],
                      ),
                    );
                  });

              // Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        )));
  }

  //  Container(
  //   alignment: Alignment.center,
  //   padding: const EdgeInsets.all(8.0),
  //   child:
  // (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
  // ),

  //       ));
  // }

  // Column buildColumn() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       TextField(
  //         controller: _controller,
  //         decoration: const InputDecoration(hintText: 'Enter Title'),
  //       ),
  //       ElevatedButton(
  //         onPressed: () {
  //           setState(() {
  //             _futureAlbum = sendData(_controller.text);
  //           });
  //         },
  //         child: const Text('Create Data'),
  //       ),
  //     ],
  //   );
  // }

}

// FutureBuilder<Album> buildFutureBuilder() {
//   return FutureBuilder<Album>(
//     future: _futureAlbum,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         return Text(snapshot.data!.title);
//       } else if (snapshot.hasError) {
//         return Text('${snapshot.error}');
//       }

//       return const CircularProgressIndicator();
//     },
//   );
// }
