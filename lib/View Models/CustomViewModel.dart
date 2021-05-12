import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import "package:async/async.dart";
import 'package:kisan/Models/UserDataParser.dart';
import 'package:kisan/Models/UserProfileParser.dart';
import 'package:kisan/services/web_service.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomViewModel extends ChangeNotifier {
  var verification_token = null;
  UserDataParser userData;
  UserProfileParser userprofileData;
  String image_url, image_bigthumb_url, image_smallthumb_url;

  Future sendOTP(String phoneNumber, String OPT) async {
    final response = await WebService().sendOTP(phoneNumber, OPT);

    var responseDecoded = jsonDecode(response.body);
    var responseDecodedSuccess = responseDecoded['success'];
    var responseDecodedMsg = responseDecoded['message'].toString();

    if (responseDecodedSuccess == "false") {
      notifyListeners();
      return responseDecodedMsg;
    } else if (responseDecodedSuccess == "true") {
      verification_token = responseDecoded['data']['token'].toString();
      notifyListeners();
      return responseDecodedMsg;
    } else {
      notifyListeners();
      return "error";
    }
  }

  Future verifyOTP(String verification_code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response =
        await WebService().verifyOTP(verification_token, verification_code);

    var responseDecoded = jsonDecode(response.body);
    var responseDecodedSuccess = responseDecoded['success'];
    var responseDecodedMsg = responseDecoded['message'].toString();

    if (responseDecodedSuccess == "false") {
      notifyListeners();
      return responseDecodedMsg;
    } else if (responseDecodedSuccess == "true") {
      print("response" + responseDecodedMsg.toString());
      if (responseDecodedMsg == "This is signup.") {
        prefs.setString("token", responseDecoded['registration_token']);
      } else {
        prefs.setString("token", responseDecoded['token']);
      }

      notifyListeners();
      return responseDecodedMsg;
    } else {
      notifyListeners();
      return "error";
    }
  }

  Future GetProfileData() async {
    final response = await WebService().GetProfileData();

    if (response != "error") {
      print("GetProfileData");
      var responseDecoded = jsonDecode(response.body);
      userData = new UserDataParser(
        responseDecoded['email'].toString(),
        responseDecoded['username'].toString(),
        responseDecoded['first_name'].toString(),
        responseDecoded['last_name'].toString(),
      );
      userprofileData = new UserProfileParser(
          responseDecoded['user_profile']['about'],
          responseDecoded['user_profile']['account_type'],
          responseDecoded['user_profile']['address1'],
          responseDecoded['user_profile']['address2'],
          responseDecoded['user_profile']['address3'],
          responseDecoded['user_profile']['city'],
          responseDecoded['user_profile']['state'],
          responseDecoded['user_profile']['pin'],
          responseDecoded['user_profile']['country'],
          responseDecoded['user_profile']['mobile1'],
          responseDecoded['user_profile']['email'],
          responseDecoded['user_profile']['has_paid'],
          responseDecoded['user_profile']['longitude'],
          responseDecoded['user_profile']['latitude'],
          responseDecoded['user_profile']['designation'],
          responseDecoded['user_profile']['occupation'],
          responseDecoded['user_profile']['occupation_other'],
          responseDecoded['user_profile']['gender'],
          responseDecoded['user_profile']['avatar'],
          responseDecoded['user_profile']['image_url'],
          responseDecoded['user_profile']['image_bigthumb_url'],
          responseDecoded['user_profile']['image_smallthumb_url'],
          responseDecoded['user_profile']['registration_type'],
          responseDecoded['user_profile']['is_email_verified'],
          responseDecoded['user_profile']['is_mobile_verified'],
          responseDecoded['user_profile']['sso_id'],
          responseDecoded['user_profile']['tehsil'],
          responseDecoded['user_profile']['is_dnd'],
          responseDecoded['user_profile']['whatsapp_opt_in_status'],
          responseDecoded['user_profile']['user']);
      notifyListeners();
      return "success";
    } else {
      print("***error");
      notifyListeners();
      return "error";
    }
  }

  Future ImageUpload(File image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await WebService().ImageUpload(image);
    if (response != "error") {
      //if condition, to refresh profiledata on email upload only if user logged in
      notifyListeners();
      return "success";
    } else {
      print("***error");
      notifyListeners();
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
    final response = await WebService().Register(
        first_name,
        last_name,
        address1,
        city,
        state,
        longitude,
        latitude,
        pin_code,
        login_type,
        email,
        email_source,
        mark_email_verified,
        reg_type);

    if (response != "error") {
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        print("response" + responseDecodedMsg.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", responseDecoded['token']);

        userData = new UserDataParser(
          responseDecoded['user']['email'].toString(),
          responseDecoded['user']['username'].toString(),
          responseDecoded['user']['first_name'].toString(),
          responseDecoded['user']['last_name'].toString(),
        );
        userprofileData = new UserProfileParser(
            responseDecoded['user']['user_profile']['about'],
            responseDecoded['user']['user_profile']['account_type'],
            responseDecoded['user']['user_profile']['address1'],
            responseDecoded['user']['user_profile']['address2'],
            responseDecoded['user']['user_profile']['address3'],
            responseDecoded['user']['user_profile']['city'],
            responseDecoded['user']['user_profile']['state'],
            responseDecoded['user']['user_profile']['pin'],
            responseDecoded['user']['user_profile']['country'],
            responseDecoded['user']['user_profile']['mobile1'],
            responseDecoded['user']['user_profile']['email'],
            responseDecoded['user']['user_profile']['has_paid'],
            responseDecoded['user']['user_profile']['longitude'],
            responseDecoded['user']['user_profile']['latitude'],
            responseDecoded['user']['user_profile']['designation'],
            responseDecoded['user']['user_profile']['occupation'],
            responseDecoded['user']['user_profile']['occupation_other'],
            responseDecoded['user']['user_profile']['gender'],
            responseDecoded['user']['user_profile']['avatar'],
            responseDecoded['user']['user_profile']['image_url'],
            responseDecoded['user']['user_profile']['image_bigthumb_url'],
            responseDecoded['user']['user_profile']['image_smallthumb_url'],
            responseDecoded['user']['user_profile']['registration_type'],
            responseDecoded['user']['user_profile']['is_email_verified'],
            responseDecoded['user']['user_profile']['is_mobile_verified'],
            responseDecoded['user']['user_profile']['sso_id'],
            responseDecoded['user']['user_profile']['tehsil'],
            responseDecoded['user']['user_profile']['is_dnd'],
            responseDecoded['user']['user_profile']['whatsapp_opt_in_status'],
            responseDecoded['user']['user_profile']['user']);
        notifyListeners();
        return "success";
      } else {
        notifyListeners();
        return "error";
      }
    } else {
      print("***error");
      notifyListeners();
      return "error";
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
    final response = await WebService().UpdateProfileData(
        first_name,
        last_name,
        pin_code,
        login_type,
        email,
        email_source,
        is_email_verified,
        address1,
        city,
        state,
        longitude,
        latitude);

    if (response != "error") {
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        userData = new UserDataParser(
          responseDecoded['data']['email'].toString(),
          responseDecoded['data']['username'].toString(),
          responseDecoded['data']['first_name'].toString(),
          responseDecoded['data']['last_name'].toString(),
        );
        userprofileData = new UserProfileParser(
            responseDecoded['data']['user_profile']['about'],
            responseDecoded['data']['user_profile']['account_type'],
            responseDecoded['data']['user_profile']['address1'],
            responseDecoded['data']['user_profile']['address2'],
            responseDecoded['data']['user_profile']['address3'],
            responseDecoded['data']['user_profile']['city'],
            responseDecoded['data']['user_profile']['state'],
            responseDecoded['data']['user_profile']['pin'],
            responseDecoded['data']['user_profile']['country'],
            responseDecoded['data']['user_profile']['mobile1'],
            responseDecoded['data']['user_profile']['email'],
            responseDecoded['data']['user_profile']['has_paid'],
            responseDecoded['data']['user_profile']['longitude'],
            responseDecoded['data']['user_profile']['latitude'],
            responseDecoded['data']['user_profile']['designation'],
            responseDecoded['data']['user_profile']['occupation'],
            responseDecoded['data']['user_profile']['occupation_other'],
            responseDecoded['data']['user_profile']['gender'],
            responseDecoded['data']['user_profile']['avatar'],
            responseDecoded['data']['user_profile']['image_url'],
            responseDecoded['data']['user_profile']['image_bigthumb_url'],
            responseDecoded['data']['user_profile']['image_smallthumb_url'],
            responseDecoded['data']['user_profile']['registration_type'],
            responseDecoded['data']['user_profile']['is_email_verified'],
            responseDecoded['data']['user_profile']['is_mobile_verified'],
            responseDecoded['data']['user_profile']['sso_id'],
            responseDecoded['data']['user_profile']['tehsil'],
            responseDecoded['data']['user_profile']['is_dnd'],
            responseDecoded['data']['user_profile']['whatsapp_opt_in_status'],
            responseDecoded['data']['user_profile']['user']);
        notifyListeners();
        return "success";
      } else {
        notifyListeners();
        return "error";
      }
    } else {
      print("***error");
      notifyListeners();
      return "error";
    }
  }
}
