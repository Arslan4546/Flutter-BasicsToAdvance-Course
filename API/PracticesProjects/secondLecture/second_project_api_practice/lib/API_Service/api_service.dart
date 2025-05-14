import 'dart:convert';
import 'package:http/http.dart';

// Extension method for checing status code
extension ResponseStatus on Response {
  bool get isSuccessfull => statusCode == 200 || statusCode == 201;
}

// class for API Service
abstract class ApiService {
  // Making baseAPI Variable
  static const String baseURl = "";
  // abstract Variable apiURL
  String get apiURL;
  // This is the resultant Variable url
  String get url => baseURl + apiURL;

  // fetch API Function
  Future<dynamic> fetchAPI({String? endPoint}) async {
    var response = await get(Uri.parse("$url$endPoint"));
    if (response.isSuccessfull) {
      return jsonDecode(response.body);
    }
  }

  // insert API Function
  Future<bool> insertAPI(Map<String, dynamic> map) async {
    var response = await post(Uri.parse(url), body: map);
    return response.isSuccessfull;
  }
}
