class ProvinceModal {
  ProvinceModal({
    required this.provinceId,
    required this.name,
    required this.altName,
    required this.longitude,
    required this.latitude,
    required this.area,
    required this.population,
    required this.districts,
  });

  int provinceId;
  String name;
  String altName;
  String longitude;
  String latitude;
  String area;
  String population;
  List<District> districts;

  factory ProvinceModal.fromJson(Map<String, dynamic> json) => ProvinceModal(
        provinceId: json["province_id"],
        name: json["name"],
        altName: json["alt_name"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        area: json["area"],
        population: json["population"],
        districts: List<District>.from(
            json["districts"].map((x) => District.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "province_id": provinceId,
        "name": name,
        "alt_name": altName,
        "longitude": longitude,
        "latitude": latitude,
        "area": area,
        "population": population,
        "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
      };
}

class District {
  District({
    required this.districtId,
    required this.name,
    required this.altName,
    required this.longitude,
    required this.latitude,
  });

  int districtId;
  String name;
  String altName;
  String longitude;
  String latitude;

  factory District.fromJson(Map<String, dynamic> json) => District(
        districtId: json["district_id"],
        name: json["name"],
        altName: json["alt_name"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "district_id": districtId,
        "name": name,
        "alt_name": altName,
        "longitude": longitude,
        "latitude": latitude,
      };
}
