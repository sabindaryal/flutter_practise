import 'package:flutter/material.dart';

class sucessPage extends StatefulWidget {
  const sucessPage({Key? key}) : super(key: key);

  @override
  State<sucessPage> createState() => _sucessPageState();
}

class _sucessPageState extends State<sucessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: const [
              Text('data'),
              SizedBox(
                height: 300,
              ),
              Text('dataa'),
              Text('data'),
              SizedBox(
                height: 300,
              ),
              Text('dataa'),
              Text('data'),
              SizedBox(
                height: 300,
              ),
              Text('dataa'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('two'),
            Text('two'),
            Text('two'),
            Text('two'),
            Text('two'),
          ],
        ),
        const Text('three')
      ],
    )));
  }
}
