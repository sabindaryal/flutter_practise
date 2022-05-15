import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practise/login/sucess.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final snackBar = const SnackBar(
  //   content: Text('Yay! A SnackBar!'),
  // );

  login(String email, password) async {
    try {
      final response = await http.post(
          Uri.parse('http://192.168.1.171/houserentapi/register/login.php'),
          body: jsonEncode({'email': email, "password": password}));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['status'] == 401) {
          const snackBar = SnackBar(
            content: Text('error'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          snackBar;
        }

        if (data['status'] == 200) {
          return Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return const sucessPage();
          })));
        }
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'field can\'t be empty ';
                      }
                      if (!RegExp(
                              r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
                          .hasMatch(value)) {
                        return 'Password requirement doesn\'t match';
                      }
                      return null;
                    }),
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
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        label: Text('password'),
                        enabledBorder: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: const Text('login')),
          ],
        ),
      )),
    );
  }
}
