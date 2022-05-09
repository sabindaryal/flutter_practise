import 'package:flutter/material.dart';

class PassingPage extends StatefulWidget {
  final String title, value;
  const PassingPage({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  State<PassingPage> createState() => _PassingPageState();
}

class _PassingPageState extends State<PassingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title.toString()),
        Text(widget.value.toString()),
      ],
    );
  }
}
