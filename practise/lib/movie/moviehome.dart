import 'package:flutter/material.dart';

class moviePage extends StatefulWidget {
  const moviePage({Key? key}) : super(key: key);

  @override
  State<moviePage> createState() => _moviePageState();
}

class _moviePageState extends State<moviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [Text('')],
      )),
    );
  }
}
