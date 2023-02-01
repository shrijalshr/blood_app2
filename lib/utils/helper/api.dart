import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  static const String baseUrl = "http://192.168.1.84:8000/api";
  static const int TIME_OUT_DURATION = 20;
  final timeOutDuration = const Duration(seconds: TIME_OUT_DURATION);

  String? accessToken;

  getAccessToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    accessToken = localStorage.getString('accessToken');
    print("accessToken from getAccessToken: \t $accessToken");
  }

  Future<http.Response> postAuthData(data, apiUrl) async {
    var url = baseUrl + apiUrl;
    await getAccessToken();
    try {
      var response = await http
          .post(Uri.parse(url),
              body: jsonEncode(data), headers: setAuthHeaders())
          .timeout(timeOutDuration);

      return response;
    } on Exception {
      throw Exception("Something went wrong.  ${url.toString()}");
    }
  }

  Future<http.Response> getData(apiUrl) async {
    var url = baseUrl + apiUrl;
    try {
      var response = await http
          .get(Uri.parse(url), headers: _setHeaders())
          .timeout(timeOutDuration);
      return (response);
    } on Exception {
      throw Exception("Something went wrong.  ${url.toString()}");
    }
  }

  Future<http.Response> getAuthData(apiUrl) async {
    var url = baseUrl + apiUrl;
    await getAccessToken();
    var response = await http.get(Uri.parse(url), headers: setAuthHeaders());
    return response;
  }

  Future<http.Response?> postData(data, apiUrl) async {
    var url = baseUrl + apiUrl;
    print(url);

    var response = await http.post(
      Uri.parse(url),
      headers: _setHeaders(),
      body: jsonEncode(data),
    );
    return response;
  }

  postFile(fileName, apiUrl) async {
    var url = baseUrl + apiUrl;
    await getAccessToken();
    try {
      var response = http.MultipartRequest('POST', Uri.parse(url));
    } on Exception {
      throw Exception("Something went wrong.  ${url.toString()}");
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Vary': 'Accept',
        'Allow': 'POST, OPTIONS',
        'X-Frame-Options': 'DENY',
        'X-Content-Type-Options': 'nosniff',
        'Referrer-Policy': 'same-origin',
        'Cross-Origin-Opener-Policy': 'same-origin'
        // 'xpsu': '12345678'
      };

  // 'Accept': 'application/vnd.api+json',
  setAuthHeaders() => {
        'Content-type': 'application/json',
        'xpsu': '12345678',
        'Authorization': 'Bearer $accessToken',
        'Vary': 'Accept',
        'Allow': 'GET, POST, OPTIONS',
        'X-Frame-Options': 'DENY',
        'X-Content-Type-Options': 'nosniff',
        'Referrer-Policy': 'same-origin',
        'Cross-Origin-Opener-Policy': 'same-origin',
      };
}
