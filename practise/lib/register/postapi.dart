import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class postapi extends StatefulWidget {
  const postapi({Key? key}) : super(key: key);

  @override
  State<postapi> createState() => _postapiState();
}

class _postapiState extends State<postapi> {
  TextEditingController fnameControllar = TextEditingController();
  TextEditingController lnameControllar = TextEditingController();
  TextEditingController emailControllar = TextEditingController();
  TextEditingController passwordControllar = TextEditingController();

  void login(String fname, lname, email, password) async {
    try {
      final response = await http.post(
          Uri.parse('http://192.168.1.171/houserentapi/register/register.php'),
          body: jsonEncode({
            'fname': fname,
            'lname': lname,
            'email': email,
            'password': password
          }));

      if (response.statusCode == 200) {
        print(response.statusCode);
        var data = jsonDecode(response.body.toString());

        print('account created');
      } else {
        print('not created');
      }
    } catch (e) {
      print("error" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: fnameControllar,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    label: Text('first name'),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: lnameControllar,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    label: Text('last name'),
                    enabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: emailControllar,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    label: Text('email'),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: passwordControllar,
                obscureText: true,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    label: Text('password'),
                    enabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    login(
                      fnameControllar.text.toString(),
                      lnameControllar.text.toString(),
                      emailControllar.text.toString(),
                      passwordControllar.text.toString(),
                    );
                  },
                  child: const Text('submit')),
            ],
          ),
        ),
      )),
    );
  }
}
