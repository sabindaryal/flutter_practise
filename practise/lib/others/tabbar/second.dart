import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: const [
        Text(
          "Introduction hgghfghffffffffffffffffffffffffffffffffffffffffffto Very very very long text",
        ),
        Text('second page'),
      ]),
    );
  }
}
