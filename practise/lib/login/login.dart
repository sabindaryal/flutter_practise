import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                label: Text('email'),
                enabledBorder: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      )),
    );
  }
}
