import 'package:flutter/material.dart';
import 'package:practise/nepse/stockpage.dart';

import 'nepsemodal.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List datanepse;
  CustomSearchDelegate(
    this.datanepse,
  );
  // Future nepsedata() async {
  //   final responsedata =
  //       await http.get(Uri.parse('https://live.nepse.repl.co/api.php'));

  //   if (responsedata.statusCode == 200) ;

  // }

  // List<String> searchTerms = ['apple', 'cat', 'dog', 'elephant'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<LiveDatum> matchQuery = [];
    var a = query.isEmpty
        ? datanepse
        : datanepse.where((element) =>
            element.symbol.toLowerCase().contains(query.toLowerCase()));

    matchQuery = a.cast<LiveDatum>().toList();

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return stockPage(
                  stockname: matchQuery[index].fullName,
                  ltp: matchQuery[index].ltp,
                  ltv: matchQuery[index].ltv,
                );
              })));
            },
            child: ListTile(
              title: Text(result.fullName),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<LiveDatum>? matchQuery = [];
    var a = query.isEmpty
        ? datanepse
        : datanepse.where((element) =>
            element.symbol.toLowerCase().contains(query.toLowerCase()));
    matchQuery = a.cast<LiveDatum>().toList();
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery![index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return stockPage(
                  stockname: matchQuery![index].fullName,
                  ltp: matchQuery[index].ltp,
                  ltv: matchQuery[index].ltv,
                );
              })));
            },
            child: ListTile(
                title: Text(result.fullName), subtitle: Text(result.ltp)),
          );
        });
  }
}
