import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';
import 'package:app_open/src/data/api/dio_client.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final DioClient dioClient;

  ApiService({required this.dioClient});

  Future generateLink(String url) async {
    var response = dioClient.post("${Endpoints.createShort}?long_url=$url");
    log(response.toString());
    return response;
  }

  Future getAppPromoData() async {
    dioClient.updateBaseUrl(baseUrl: Endpoints.baseUrl2);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    var formData = FormData.fromMap({
      "token": "fadsfnklafdbkjwq35325zxxckjz2345235xsfghsghfs",
      "package_name": packageName
    });
    var response = dioClient.post("${Endpoints.appPromoData}", data: formData);
    log(response.toString());
    dioClient.updateBaseUrl();
    return response;
  }

  Future getShortCodeInfo({required String sc, required String type}) async {
    var response = dioClient.get(
        "${Endpoints.shortCodeInfo}?short_code=$sc&type=$type"); //replace 1 with userid
    log(response.toString());
    return response;
  }

  Future getTotalGeneratedLinks() async {
    var response =
        dioClient.get(Endpoints.getTotalLinks); //replace 1 with userid
    log(response.toString());
    return response;
  }
}
