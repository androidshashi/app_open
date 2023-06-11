// To parse this JSON data, do
//
//     final totalLinksResponseModel = totalLinksResponseModelFromJson(jsonString);

import 'dart:convert';

TotalLinksResponseModel totalLinksResponseModelFromJson(String str) => TotalLinksResponseModel.fromJson(json.decode(str));

String totalLinksResponseModelToJson(TotalLinksResponseModel data) => json.encode(data.toJson());

class TotalLinksResponseModel {
  TotalLinksResponseModel({
    this.totalLinks,
    this.message,
    this.success,
  });

  int? totalLinks;
  String? message;
  bool? success;

  factory TotalLinksResponseModel.fromJson(Map<String, dynamic> json) => TotalLinksResponseModel(
    totalLinks: json["totalLinks"],
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "totalLinks": totalLinks,
    "message": message,
    "success": success,
  };
}
