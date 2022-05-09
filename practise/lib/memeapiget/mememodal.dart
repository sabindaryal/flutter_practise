// To parse this JSON data, do
//
//     final meme = memeFromJson(jsonString);

import 'dart:convert';

Meme memeFromJson(String str) => Meme.fromJson(json.decode(str));

String memeToJson(Meme data) => json.encode(data.toJson());

class Meme {
  Meme({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory Meme.fromJson(Map<String, dynamic> json) => Meme(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.memes,
  });

  List<MemeElement> memes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        memes: List<MemeElement>.from(
            json["memes"].map((x) => MemeElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "memes": List<dynamic>.from(memes.map((x) => x.toJson())),
      };
}

class MemeElement {
  MemeElement({
    required this.id,
    required this.name,
    required this.url,
    required this.width,
    required this.height,
    required this.boxCount,
  });

  String id;
  String name;
  String url;
  int width;
  int height;
  int boxCount;

  factory MemeElement.fromJson(Map<String, dynamic> json) => MemeElement(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        boxCount: json["box_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "width": width,
        "height": height,
        "box_count": boxCount,
      };
}
