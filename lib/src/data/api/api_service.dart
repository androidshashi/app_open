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

  Future urlList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    var response = dioClient.get('batch/list/$userId'); //replace 1 with userid
    log(response.toString());
    return response;
  }
}
