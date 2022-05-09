class Post {
  late String name;
  late String job;
  // final String id;
  // DateTime postDate;

  Post({
    // required this.id,
    required this.job,
    required this.name,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      // 'id': id,
      'fname': name,
      'lname': job,
      // "createdAt": DateTime,
    };
    return map;
  }
  // factory Post.fromJson(Map<String, dynamic> json) {
  //   return Post(
  //       id: json['id'],
  //       name: json['name'],
  //       job: json['job'],
  //       postDate: DateTime.parse(json['createdAt']));
  // }
}
