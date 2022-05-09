import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practise/post/modalclass.dart';

class postPafe extends StatefulWidget {
  const postPafe({Key? key}) : super(key: key);

  @override
  State<postPafe> createState() => _postPafeState();
}

class _postPafeState extends State<postPafe> {
  // TextEditingController nameControl = TextEditingController();
  // TextEditingController jobCOntrol = TextEditingController();
  final snackBar = const SnackBar(
    content: Text('Email Already Exist'),
  );
  final sucessmsg = const SnackBar(
    content: Text('sucessfully register'),
  );
  late Post posts;
  Future submitData() async {
    try {
      var response = await http.post(
          Uri.parse('http://192.168.1.171/houserentapi/register/register.php'),
          body: posts.toJson());
      // print(response.statusCode);
      print(response.body);
      var data = response.body;
      if (response.statusCode == 200) {
        // Navigator.pop(context);
        // ScaffoldMessenger.of(context).showSnackBar(sucessmsg);
        print("sucess");
      }
      if (response.statusCode == 409) {
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("409");
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    posts = Post(
      name: 'name',
      job: 'job',
    );
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              // const Align(
              //     alignment: Alignment.center, child: Text('post pages')),
              // SizedBox(
              //   height: 30,
              // ),
              // TextFormField(
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(), hintText: 'enter name'),
              //   controller: nameControl,
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // TextFormField(
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(), hintText: 'enter job'),
              //   controller: jobCOntrol,
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       // String name=nameControl.text; String job=jobCOntrol.text;

              //       submitData("ram", 'shyam');
              //     },
              //     child: const Text('submit')),
              Form(
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          onSaved: (input) => posts.name = input!,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return 'field can\'t be empty ';
                            }

                            return null;
                          }),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              hintText: 'FirstName'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          onSaved: (input) => posts.job = input!,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return 'field can\'t be empty ';
                            }

                            return null;
                          }),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              hintText: 'name'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),

              ElevatedButton(
                autofocus: true,
                style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    submitData();
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: ((context) {
                  //       return const MainPage();
                  //     }),
                  //   ),
                  // );
                },
                child: const Text(
                  'Sign Up ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
