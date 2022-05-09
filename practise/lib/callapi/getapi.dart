import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practise/callapi/modal.dart';

class apiPage extends StatefulWidget {
  const apiPage({Key? key}) : super(key: key);

  @override
  State<apiPage> createState() => _apiPageState();
}

class _apiPageState extends State<apiPage> {
  @override
  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getPostApi(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(postList[index].id.toString()),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("title \n" + postList[index].title),
                            const SizedBox(
                              height: 20,
                            ),
                            Image(
                                image:
                                    NetworkImage(postList[index].thumbnailUrl)),
                            Image(image: NetworkImage(postList[index].url)),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
