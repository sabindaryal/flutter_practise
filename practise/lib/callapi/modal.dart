// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// class PostsModel {
//   int userId;
//   int id;
//   String title;
//   String body;

//   PostsModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });

//   factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );

//   // Map<String, dynamic> toJson() => {
//   //       "userId": userId,
//   //       "id": id,
//   //       "title": title,
//   //       "body": body,
//   //     };
// }
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class PostsModel {
  PostsModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  // Map<String, dynamic> toJson() => {
  //       "albumId": albumId,
  //       "id": id,
  //       "title": title,
  //       "url": url,
  //       "thumbnailUrl": thumbnailUrl,
  //     };
}
