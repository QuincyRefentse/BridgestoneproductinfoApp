import 'package:meta/meta.dart';
import 'dart:convert';

industrialTyreModel industrialTyreModelFromJson(String str) => industrialTyreModel.fromJson(json.decode(str));

String industrialTyreModelToJson(industrialTyreModel data) => json.encode(data.toJson());

class industrialTyreModel {

  final String tyre_name;
  final String category;
  final String id;
  final String image;
  final String description;
  final String brand;
  final String materialcode;
  final String liSi;
  final String inch;
  final String size;
  final String pattern;
  final String fitmentmakeAndModel;
  final String liSs;
  final String rimInches;
  final String repWar;
  final String tyreSize;
  final String xl;
  final String rft;
  final String tdg;
  final String segment;

  industrialTyreModel({
    required this.tyre_name,
    required this.category,
    required this.id,
    required this.image,
    required this.description,
    required this.brand,
    required this.materialcode,
    required this.liSi,
    required this.inch,
    required this.size,
    required this.pattern,
    required this.fitmentmakeAndModel,
    required this.liSs,
    required this.rimInches,
    required this.repWar,
    required this.tyreSize,
    required this.xl,
    required this.rft,
    required this.tdg,
    required this.segment,
  });

  factory industrialTyreModel.fromJson(Map<String, dynamic> json) => industrialTyreModel(
    category: json["category"],
    id: json["id"],
    image: json["image"],
    description: json["description"],
    brand: json["brand"],
    materialcode: json["materialcode"],
    liSi: json["LI_SI"],
    inch: json["inch"],
    size: json["size"],
    pattern: json["pattern"],
    fitmentmakeAndModel: json["fitmentmake_and_model"],
    liSs: json["LI_SS"],
    rimInches: json["rimInches"],
    repWar: json["REP_WAR"],
    tyreSize: json["tyreSize"],
    xl: json["XL"],
    rft: json["RFT"],
    tdg: json["TDG"],
    segment: json["segment"],
    tyre_name: json["tyre_name"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "id": id,
    "image": image,
    "description": description,
    "brand": brand,
    "materialcode": materialcode,
    "LI_SI": liSi,
    "inch": inch,
    "size": size,
    "pattern": pattern,
    "fitmentmake_and_model": fitmentmakeAndModel,
    "LI_SS": liSs,
    "rimInches": rimInches,
    "REP_WAR": repWar,
    "tyreSize": tyreSize,
    "XL": xl,
    "RFT": rft,
    "TDG": tdg,
    "segment": segment,
    "tyre_name": tyre_name
  };
}
