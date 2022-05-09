// class People {
//   String? firstName;
//   String? lastName;
//   String? email;

//   People(
//       {required this.firstName, required this.email, required this.lastName});

//   factory People.fromJson(Map<String, dynamic> json) => People(
//         firstName: json['title'],
//         email: json['body'],
//         lastName: json['last_name'],
//       );
// }
class Album {
  final int id;
  final String title;
  final String body;

  const Album({required this.id, required this.body, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  get length => null;
}
