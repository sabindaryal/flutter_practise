class Products {
  String? price;
  String? des;
  String? fullName;

  Products({required this.price, required this.fullName, required this.des});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
      // symbol: json["symbol"], ltp: json["ltp"],
      price: json['author'],
      fullName: json["name"],
      des: json['content']);
}
