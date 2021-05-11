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

  Future Register(String first_name, String last_name, String pin_code,
      String login_type, String registration_id, String image_url, String email,String email_source,bool mark_email_verified) async {
    try {
      Map data = {
        "client_id": client_id,
        "client_secret": client_secret,
        "first_name": first_name,
        "last_name": last_name,
        "pin_code": pin_code,
        "login_type": login_type,
        "registration_id": registration_id,
        "image_url": "Test Image URL",
        "image_bigthumb_url": "Test Big Thumb URL",
        "image_smallthumb_url": "Test Small Thumb URL",
        "email": email,
        "email_source": "manual",
        "mark_email_verified": false,
        "reg_type": "mobile"
      };

      var body = json.encode(data);

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
