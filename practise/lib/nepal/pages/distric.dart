import 'package:flutter/material.dart';

class districtPage extends StatefulWidget {
  const districtPage({Key? key}) : super(key: key);

  @override
  State<districtPage> createState() => _districtPageState();
}

class _districtPageState extends State<districtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        Text('district page'),
      ]),
    );
  }
}
