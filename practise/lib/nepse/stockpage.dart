import 'package:flutter/material.dart';

class stockPage extends StatefulWidget {
  final String stockname, ltp, ltv;

  const stockPage(
      {Key? key, required this.stockname, required this.ltp, required this.ltv})
      : super(key: key);

  @override
  State<stockPage> createState() => _stockPageState();
}

class _stockPageState extends State<stockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [Text(widget.stockname), Text(widget.ltp), Text(widget.ltv)],
    )));
  }
}
