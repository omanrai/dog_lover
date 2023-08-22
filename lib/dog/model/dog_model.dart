// To parse this JSON data, do
//
//     final dogModel = dogModelFromJson(jsonString);

import 'dart:convert';

List<DogModel> dogModelFromJson(String str) => List<DogModel>.from(json.decode(str).map((x) => DogModel.fromJson(x)));

String dogModelToJson(List<DogModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DogModel {
  DogModel({
    this.bredFor,
    this.breedGroup,
    this.height,
    this.id,
    this.image,
    this.lifeSpan,
    this.name,
    this.origin,
    this.referenceImageId,
    this.temperament,
    this.weight,
    this.countryCode,
    this.description,
    this.history,
  });

  String? bredFor;
  BreedGroup? breedGroup;
  Eight? height;
  int? id;
  Image? image;
  String? lifeSpan;
  String? name;
  String? origin;
  String? referenceImageId;
  String? temperament;
  Eight? weight;
  CountryCode? countryCode;
  String? description;
  String? history;

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        bredFor: json["bred_for"] == null ? null : json["bred_for"],
        breedGroup: json["breed_group"] == null ? null : breedGroupValues.map[json["breed_group"]],
        height: Eight.fromJson(json["height"]),
        id: json["id"],
        image: Image.fromJson(json["image"]),
        lifeSpan: json["life_span"],
        name: json["name"],
        origin: json["origin"] == null ? null : json["origin"],
        referenceImageId: json["reference_image_id"],
        temperament: json["temperament"] == null ? null : json["temperament"],
        weight: Eight.fromJson(json["weight"]),
        countryCode: json["country_code"] == null ? null : countryCodeValues.map[json["country_code"]],
        description: json["description"] == null ? null : json["description"],
        history: json["history"] == null ? null : json["history"],
      );

  Map<String, dynamic> toJson() => {
        "bred_for": bredFor == null ? null : bredFor,
        "breed_group": breedGroup == null ? null : breedGroupValues.reverse[breedGroup],
        "height": height!.toJson(),
        "id": id,
        "image": image!.toJson(),
        "life_span": lifeSpan,
        "name": name,
        "origin": origin == null ? null : origin,
        "reference_image_id": referenceImageId,
        "temperament": temperament == null ? null : temperament,
        "weight": weight!.toJson(),
        "country_code": countryCode == null ? null : countryCodeValues.reverse[countryCode],
        "description": description == null ? null : description,
        "history": history == null ? null : history,
      };
}

enum BreedGroup { TOY, HOUND, TERRIER, WORKING, MIXED, EMPTY, NON_SPORTING, SPORTING, HERDING }

final breedGroupValues = EnumValues({
  "": BreedGroup.EMPTY,
  "Herding": BreedGroup.HERDING,
  "Hound": BreedGroup.HOUND,
  "Mixed": BreedGroup.MIXED,
  "Non-Sporting": BreedGroup.NON_SPORTING,
  "Sporting": BreedGroup.SPORTING,
  "Terrier": BreedGroup.TERRIER,
  "Toy": BreedGroup.TOY,
  "Working": BreedGroup.WORKING
});

enum CountryCode { AG, US, AU }

final countryCodeValues = EnumValues({"AG": CountryCode.AG, "AU": CountryCode.AU, "US": CountryCode.US});

class Eight {
  Eight({
    this.imperial,
    this.metric,
  });

  String? imperial;
  String? metric;

  factory Eight.fromJson(Map<String, dynamic> json) => Eight(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}

class Image {
  Image({
    this.height,
    this.id,
    this.url,
    this.width,
  });

  int? height;
  String? id;
  String? url;
  int? width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        id: json["id"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "id": id,
        "url": url,
        "width": width,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
