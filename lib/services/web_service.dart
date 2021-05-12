import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kisan/Helpers/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

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

  Future GetProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(
        profiles,
        headers: {
          'Authorization': 'Bearer ' + prefs.getString("token"),
        },
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        return "error";
      }
    } catch (Exception) {
      print("exception" + Exception.toString());
    }
  }

  Future ImageUpload(File image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var streamFront = new http.ByteStream(Stream.castFrom(image.openRead()));
      var lengthFront = await image.length();
      var uri = Uri.parse(image_upload);
      var request = new http.MultipartRequest("POST", uri);
      var multipartFileFront = new http.MultipartFile(
          "myfile", streamFront, lengthFront,
          filename: basename(image.path));
      request.files.add(multipartFileFront);
      request.headers
          .addAll({'Authorization': 'Bearer ' + prefs.getString("token")});
      var respond = await request.send();
      if (respond.statusCode == 200) {
        return "success";
      } else {
        return "error";
      }
    } catch (Exception) {
      print("exception" + Exception.toString());
      return "error";
    }
  }

  Future Register(
      String first_name,
      String last_name,
      String address1,
      String city,
      String state,
      String longitude,
      String latitude,
      String pin_code,
      String login_type,
      String email,
      String email_source,
      bool mark_email_verified,
      String reg_type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      Map data = {
        "client_id": client_id,
        "client_secret": client_secret,
        "first_name": first_name??"",
        "last_name": last_name??"",
        "address1": address1??"",
        "city": city??"",
        "state": state??"",
        "longitude": longitude??"",
        "latitude": latitude??"",
        "pin_code": pin_code??"",
        "login_type": login_type,
        "registration_id": prefs.getString("token"),
        "email": email,
        "email_source": email_source,
        "mark_email_verified": mark_email_verified,
        "reg_type": reg_type
      };

      var body = json.encode(data);

      final response = await http.post(register,
          headers: {
            "Content-Type": "application/json",
          },
          body: body);

      if (response.statusCode == 200) {
        return response;
      } else {
        return "error";
      }
    } catch (Exception) {
      print("exception" + Exception.toString());
    }
  }

  Future UpdateProfileData(
      String first_name,
      String last_name,
      String pin_code,
      String login_type,
      String email,
      String email_source,
      bool is_email_verified,
      String address1,
      String city,
      String state,
      String longitude,
      String latitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      Map data = {
        "user_details": {
          "first_name": first_name,
          "last_name": last_name,
          "email": email
        },
        "user_profile": {
          "email": email,
          "is_email_verified": is_email_verified,
          "address1": address1,
          "city": city,
          "state": state,
          "pin": pin_code,
          "longitude": longitude,
          "latitude": latitude,
          "email_source": email_source
        },
        "notification_consent": {
          "method": "OPT_IN",
          "source": "android",
          "mode": "whatsapp"
        }
      };

      var body = json.encode(data);

      final response = await http.put(profiles,
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer ' + prefs.getString("token"),
          },
          body: body);

      if (response.statusCode == 200) {
        return response;
      } else {
        return "error";
      }
    } catch (Exception) {
      print("exception" + Exception.toString());
    }
  }
}
