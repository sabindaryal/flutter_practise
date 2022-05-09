// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class PostService {
//   // List<People> detial = [];
//   Future<List> getPost() async {
//     try {
//       // detial = [];
//       var response =
//           await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
//       // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//       final data = jsonDecode(response.body)['data'];

//       // for (var info in data) {
//       //   detial.add(People.fromJson(info));
//       // }
//       if (response.statusCode == 200) {
//         // print(detial);

//         return (data);
//       } else {
//         return Future.error("server erro");
//       }
//     } catch (error) {
//       return Future.error('error error');
//     }
//   }

//   Future<String> postData(Map<String, dynamic> firstName, lastName) async {
//     try {
//       // detial = [];https://reqres.in/api/users
//       var response = await http.post(
//           Uri.parse(
//               'http://192.168.1.171/houserentapi/register/api-fetch-all.php'),
//           body: jsonEncode(<String, dynamic>{
//             "first_name": firstName,
//             "last_name": lastName
//           }),
//           headers: <String, String>{
//             "Content-Type": "application/json; charset=UTF-8"
//           });
//       print(response.body);
//       // await http.get(Uri.parse(
//       //     'http://192.168.1.171/houserentapi/register/api-fetch-all.php'));
//       // print(response.body);
//       final data = jsonDecode(response.body)['data'];

//       // for (var info in data) {
//       //   detial.add(People.fromJson(info));
//       // }
//       if (response.statusCode == 201) {
//         // print(detial);
//         print('status code 201');
//         return ('sucesss');
//       } else {
//         return ("server erro");
//       }
//     } catch (error) {
//       return ('error error');
//     }
//   }
// }
