import 'package:flutter/material.dart';

class stockPage extends StatefulWidget {
  final String stockname,
      ltp,
      ltv,
      symbol,
      percentChange,
      high,
      low,
      open,
      qty,
      previousClose,
      fullName,
      stockinfo;

  const stockPage({
    Key? key,
    required this.stockname,
    required this.ltp,
    required this.ltv,
    required this.symbol,
    required this.percentChange,
    required this.high,
    required this.low,
    required this.open,
    required this.qty,
    required this.previousClose,
    required this.fullName,
    required this.stockinfo,
  }) : super(key: key);

  @override
  State<stockPage> createState() => _stockPageState();
}

class _stockPageState extends State<stockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'Stock',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.stockname,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Symbol :" + widget.symbol,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(
                height: 4,
              ),
              Text("Last Trading Price :" + widget.ltp,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(
                height: 4,
              ),
              Text("Last Trading Volume :" + widget.ltv,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(
                height: 4,
              ),
              Text("Today Opening Price :" + widget.open,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(
                height: 4,
              ),
              Text("Percent change :" + widget.percentChange,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(
                height: 4,
              ),
              Text("Today High Price:" + widget.high,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(
                height: 4,
              ),
              Text("Today low Price:" + widget.low,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(
                height: 4,
              ),
              Text("Previous closing price :" + widget.previousClose,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        )));
  }
}
