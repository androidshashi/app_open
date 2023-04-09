import 'package:hive/hive.dart';

part 'history_model.g.dart';

@HiveType(typeId: 1,)
class HistoryModel{
  @HiveField(0)
  String? longUrl;
  @HiveField(1)
  String? shortUrl;
  @HiveField(2)
  String? type;
  @HiveField(3)
  int? hits;
  HistoryModel({this.longUrl, this.shortUrl, this.type, this.hits});
}