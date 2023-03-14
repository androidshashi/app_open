// To parse this JSON data, do
//
//     final batchlistResponseModel = batchlistResponseModelFromJson(jsonString);

// import 'dart:convert';

// BatchlistResponseModel batchlistResponseModelFromJson(String str) => BatchlistResponseModel.fromJson(json.decode(str));

// String batchlistResponseModelToJson(BatchlistResponseModel data) => json.encode(data.toJson());

class BatchlistResponseModel {
  BatchlistResponseModel({
    required this.batchList,
  });

  List<BatchList> batchList;

  factory BatchlistResponseModel.fromJson(Map<String, dynamic> json) =>
      BatchlistResponseModel(
        batchList: List<BatchList>.from(
            json["batchList"].map((x) => BatchList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "batchList": List<dynamic>.from(batchList.map((x) => x.toJson())),
      };
}

class BatchList {
  BatchList({
    required this.batchId,
    required this.batchName,
    required this.batchOwner,
    required this.batchCreationDate,
    required this.batchStartDate,
    required this.batchEndDate,
    required this.batchAmount,
    required this.totalAmount,
    required this.batchSize,
    required this.userId,
    required this.userCircleId,
    required this.circleId,
    required this.circleName,
    this.batchCurrency,
    required this.batchStatus,
  });

  String batchId;
  String batchName;
  dynamic batchOwner;
  DateTime batchCreationDate;
  DateTime batchStartDate;
  DateTime batchEndDate;
  String batchAmount;
  String totalAmount;
  String batchSize;
  String userId;
  String userCircleId;
  String circleId;
  String circleName;
  dynamic batchCurrency;
  String batchStatus;

  factory BatchList.fromJson(Map<String, dynamic> json) => BatchList(
        batchId: json["batchId"],
        batchName: json["batchName"],
        batchOwner: json["batchOwner"],
        batchCreationDate: DateTime.parse(json["batchCreationDate"]),
        batchStartDate: DateTime.parse(json["batchStartDate"]),
        batchEndDate: DateTime.parse(json["batchEndDate"]),
        batchAmount: json["batchAmount"],
        totalAmount: json["totalAmount"],
        batchSize: json["batchSize"],
        userId: json["userId"],
        userCircleId: json["userCircleId"],
        circleId: json["circleId"],
        circleName: json["circleName"],
        batchCurrency: json["batchCurrency"],
        batchStatus: json["batchStatus"],
      );

  Map<String, dynamic> toJson() => {
        "batchId": batchId,
        "batchName": batchName,
        "batchOwner": batchOwner,
        "batchCreationDate": batchCreationDate.toIso8601String(),
        "batchStartDate":
            "${batchStartDate.year.toString().padLeft(4, '0')}-${batchStartDate.month.toString().padLeft(2, '0')}-${batchStartDate.day.toString().padLeft(2, '0')}",
        "batchEndDate":
            "${batchEndDate.year.toString().padLeft(4, '0')}-${batchEndDate.month.toString().padLeft(2, '0')}-${batchEndDate.day.toString().padLeft(2, '0')}",
        "batchAmount": batchAmount,
        "totalAmount": totalAmount,
        "batchSize": batchSize,
        "userId": userId,
        "userCircleId": userCircleId,
        "circleId": circleId,
        "circleName": circleName,
        "batchCurrency": batchCurrency,
        "batchStatus": batchStatus,
      };
}
