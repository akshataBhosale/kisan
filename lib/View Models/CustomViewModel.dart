import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import "package:async/async.dart";
import 'package:kisan/services/web_service.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class CustomViewModel extends ChangeNotifier {
  var verification_token = null, registration_token = null, token = null;

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
        registration_token = responseDecoded['registration_token'].toString();
      } else {
        token = responseDecoded['token'].toString();
      }
      notifyListeners();
      return responseDecodedMsg;
    } else {
      notifyListeners();
      return "error";
    }
  }


  Future Register(String verification_code) async {
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
        registration_token = responseDecoded['registration_token'].toString();
      } else {
        token = responseDecoded['token'].toString();
      }
      notifyListeners();
      return responseDecodedMsg;
    } else {
      notifyListeners();
      return "error";
    }
  }

}
