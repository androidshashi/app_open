import 'dart:convert';
import 'dart:developer';
import 'package:app_open/src/data/api/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final DioClient dioClient;
  ApiService({required this.dioClient});

  Future login(data) async {
    var response = await dioClient.post('${Endpoints.baseUrl}user/login',
        data: json.encode(data));
    log(response.toString());
    return response;
  }

  Future circleList(data) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    var response = await dioClient.get(
      '${Endpoints.baseUrl}circle/list/$userId',
    );
    log(response.toString());
    return response;
  }

  Future circleBatchList(String circleId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    var response = await dioClient.get(
      '${Endpoints.baseUrl}circlebatch/list/${userId}_$circleId',
    );
    return response;
  }

  Future circleContactList(String circleId) async {
    var response = await dioClient.get(
      '${Endpoints.baseUrl}member/list/C_$circleId',
    );
    return response;
  }

  Future createNewCircle(data) async {
    var response = dioClient.post('circle/add',
        data: json.encode(data)); //replace 1 with userid
    log(response.toString());
    return response;
  }

  Future joinCircle(data) async {
    var response = dioClient.post('circle/join',
        data: json.encode(data)); //replace 1 with userid
    log(response.toString());
    return response;
  }

  Future createNewBatch(data) async {
    var response = dioClient.post('batch/add',
        data: json.encode(data)); //replace 1 with userid
    log(response.toString());
    return response;
  }

  Future batchList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    var response = dioClient.get('batch/list/$userId'); //replace 1 with userid
    log(response.toString());
    return response;
  }

  //Get slot list for a batch
  Future batchSlotList(String batchId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    var response = dioClient.get('slot/list/${userId}_$batchId'); //replace 1 with userid
    log(response.toString());
    return response;
  }

  ///Create a contact in this user
  Future createNewContact({required String name, required String mobileNumber,required String email,required String countryCode  }) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    var data = {
      "inMemberFullName": name,
      "inMemberMobileCode": countryCode.contains("+")?countryCode.substring(1):countryCode,
      "inMemberMobileNo": mobileNumber,//Phone number without country code
      "inMemberEmail": email,
      "inUserId": userId.toString()
    };
    var response = dioClient.post('contact/add',data: jsonEncode(data));

    log(response.toString());
    return response;
  }
  ///Get contacts for this user from server
  Future getContactsFromServer() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    var response = dioClient.get('member/list/U_$userId'); //replace 1 with userid
    log(response.toString());
    return response;
  }

  Future transactionList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    var response = await dioClient.get(
      '${Endpoints.baseUrl}transaction/list/1', //@Todo change 1 with userId
    );
    log(response.toString());
    return response;
  }

  ///---------------------Create request----------------------------
  Future createRequest(data) async {

    var response = dioClient.post('request/add',data: jsonEncode(data));
    log(response.toString());
    return response;
  }
  ///---------------------Get currency list  from server-------------------------------
  Future getCurrencyList() async {
    var response = dioClient.get('currency/list/');
    log(response.toString());
    return response;
  }
}
