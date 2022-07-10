import 'package:flutter/material.dart';

class blocPage extends StatefulWidget {
  const blocPage({Key? key}) : super(key: key);

  @override
  State<blocPage> createState() => _blocPageState();
}

class _blocPageState extends State<blocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: const [Text('data')],
      ),
    ));
  }
}
