// To parse this JSON data, do
//
//     final appPromoModel = appPromoModelFromJson(jsonString);

import 'dart:convert';

AppPromoModel appPromoModelFromJson(String str) => AppPromoModel.fromJson(json.decode(str));

String appPromoModelToJson(AppPromoModel data) => json.encode(data.toJson());

class AppPromoModel {
  AppData? appData;
  dynamic appError;
  int? responsecode;

  AppPromoModel({
    this.appData,
    this.appError,
    this.responsecode,
  });

  factory AppPromoModel.fromJson(Map<String, dynamic> json) => AppPromoModel(
    appData: json["appData"] == null ? null : AppData.fromJson(json["appData"]),
    appError: json["appError"],
    responsecode: json["responsecode"],
  );

  Map<String, dynamic> toJson() => {
    "appData": appData?.toJson(),
    "appError": appError,
    "responsecode": responsecode,
  };
}

class AppData {
  String? appTitle;
  String? appPackageName;
  String? appIconUrl;
  String? message;

  AppData({
    this.appTitle,
    this.appPackageName,
    this.appIconUrl,
    this.message,
  });

  factory AppData.fromJson(Map<String, dynamic> json) => AppData(
    appTitle: json["appTitle"],
    appPackageName: json["appPackageName"],
    appIconUrl: json["appIconUrl"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "appTitle": appTitle,
    "appPackageName": appPackageName,
    "appIconUrl": appIconUrl,
    "message": message,
  };
}
