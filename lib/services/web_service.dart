import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kisan/Helpers/constants.dart';

class WebService {
  // All items by location Apis
  Future sendOTP(String phoneNumber, String OPT) async {
    try {
      Map data = {
        "client_id": client_id,
        "client_secret": client_secret,
        "mobile": phoneNumber,
        "source": "web/app",
        "account_type": 1,
        "mode": "whatsapp",
        "method": OPT
      };
      var body = json.encode(data);
      print("body" + body.toString());
      final response = await http.post(send_custom_otp_mobile,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Unable to perform request!");
      }
    } catch (Exception) {
      print("exception" + Exception.toString());
    }
  }

  Future verifyOTP(String verification_token, String verification_code) async {
    try {
      Map data = {
        "client_id": client_id,
        "client_secret": client_secret,
        "verification_token": verification_token,
        "verification_code": verification_code,
        "source": "web/app",
        "account_type": 1,
      };
      var body = json.encode(data);
      print("body" + body.toString());
      final response = await http.post(api_token_custom_otp_auth,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Unable to perform request!");
      }
    } catch (Exception) {
      print("exception" + Exception.toString());
    }
  }
}
