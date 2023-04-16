import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';
import 'package:app_open/src/data/api/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final DioClient dioClient;
  ApiService({required this.dioClient});

  Future generateLink(String url) async {
    var response = dioClient.post("${Endpoints.createShort}?long_url=$url");
    log(response.toString());
    return response;
  }

  Future getShortCodeInfo({required String sc,required String type}) async {

    var response = dioClient.get("${Endpoints.shortCodeInfo}?short_code=$sc&type=$type"); //replace 1 with userid
    log(response.toString());
    return response;
  }
}
