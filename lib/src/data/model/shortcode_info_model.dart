// To parse this JSON data, do
//
//     final shortCodeInfoModel = shortCodeInfoModelFromJson(jsonString);

import 'dart:convert';

ShortCodeInfoModel shortCodeInfoModelFromJson(String str) => ShortCodeInfoModel.fromJson(json.decode(str));

String shortCodeInfoModelToJson(ShortCodeInfoModel data) => json.encode(data.toJson());

class ShortCodeInfoModel {
  ShortCodeInfoModel({
    this.urlData,
  });

  UrlData? urlData;

  factory ShortCodeInfoModel.fromJson(Map<String, dynamic> json) => ShortCodeInfoModel(
    urlData: json["urlData"] == null ? null : UrlData.fromJson(json["urlData"]),
  );

  Map<String, dynamic> toJson() => {
    "urlData": urlData?.toJson(),
  };
}

class UrlData {
  UrlData({
    this.longUrl,
    this.shortCode,
    this.type,
    this.errorMessage,
    this.totalLinks,
    this.siteKey,
    this.hits,
  });

  String? longUrl;
  String? shortCode;
  String? type;
  dynamic errorMessage;
  int? totalLinks;
  dynamic siteKey;
  int? hits;

  factory UrlData.fromJson(Map<String, dynamic> json) => UrlData(
    longUrl: json["longUrl"],
    shortCode: json["shortCode"],
    type: json["type"],
    errorMessage: json["errorMessage"],
    totalLinks: json["totalLinks"],
    siteKey: json["siteKey"],
    hits: json["hits"],
  );

  Map<String, dynamic> toJson() => {
    "longUrl": longUrl,
    "shortCode": shortCode,
    "type": type,
    "errorMessage": errorMessage,
    "totalLinks": totalLinks,
    "siteKey": siteKey,
    "hits": hits,
  };
}
