import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import "package:async/async.dart";
import 'package:kisan/Models/UserDataParser.dart';
import 'package:kisan/Models/UserProfileParser.dart';
import 'package:kisan/Models/AdsListParser.dart';
import 'package:kisan/Models/ProductListParser.dart';
import 'package:kisan/Models/CompaniesListParser.dart';
import 'package:kisan/Models/OfferListParser.dart';
import 'package:kisan/Models/DemoListParser.dart';
import 'package:kisan/Models/EventListParser.dart';
import 'package:kisan/Models/LaunchListParser.dart';
import 'package:kisan/Models/CategoryListParser.dart';
import 'package:kisan/services/web_service.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomViewModel extends ChangeNotifier {
  var verification_token = null;
  UserDataParser userData;
  UserProfileParser userprofileData;
  String image_url, image_bigthumb_url, image_smallthumb_url;

  List<AdsListParser> adsList = [];

  List<ProductListParser> productsList = [];
  List<ProductListParser> featuredproductsList = [];

  List<CompaniesListParser> companiesList = [];

  List<OfferListParser> offersList = [];

  List<DemoListParser> demosList = [];
  List<LaunchListParser> launchList = [];

  List<EventListParser> eventList = [];
  List<EventListParser> featuredeventList = [];

  List<CategoryListParser> categoryList = [];

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

  Future GetAds() async {
    final response = await WebService().GetAds();

    if (response != "error") {
      this.adsList.clear();
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        print("response" + responseDecodedMsg.toString());

        final data = responseDecoded['data']['records'];

        for (Map i in data) {
          adsList.add(AdsListParser.fromJson(i));
        }

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

  Future GetProducts() async {
    final response = await WebService().GetProducts();

    if (response != "error") {
      this.productsList.clear();
      this.featuredproductsList.clear();
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        print("response" + responseDecodedMsg.toString());

        final data = responseDecoded['data']['list'];

        for (Map i in data) {
          productsList.add(ProductListParser.fromJson(i));

          if (ProductListParser.fromJson(i).featured == true) {
            featuredproductsList.add(ProductListParser.fromJson(i));
          }
        }

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

  Future GetCompanies() async {
    final response = await WebService().GetCompanies();

    if (response != "error") {
      this.companiesList.clear();
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        print("response" + responseDecodedMsg.toString());

        final data = responseDecoded['data']['list'];

        for (Map i in data) {
          companiesList.add(CompaniesListParser.fromJson(i));
        }

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

  Future GetOffers() async {
    final response = await WebService().GetOffers();

    if (response != "error") {
      this.offersList.clear();
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        print("response" + responseDecodedMsg.toString());

        final data = responseDecoded['data'];

        for (Map i in data) {
          offersList.add(OfferListParser.fromJson(i));
        }

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

  Future GetDemos() async {
    final response = await WebService().GetDemos();

    if (response != "error") {
      this.demosList.clear();
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        print("response" + responseDecodedMsg.toString());

        final data = responseDecoded['data'];

        for (Map i in data) {
          demosList.add(DemoListParser.fromJson(i));
        }

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

  Future GetLatestLaunch() async {
    final response = await WebService().GetLatestLaunch();

    if (response != "error") {
      this.launchList.clear();
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        print("response" + responseDecodedMsg.toString());

        final data = responseDecoded['data'];

        for (Map i in data) {
          launchList.add(LaunchListParser.fromJson(i));
        }

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

  Future GetEvents() async {
    final response = await WebService().GetEvents();

    if (response != "error") {
      this.eventList.clear();
      this.featuredeventList.clear();
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == "false") {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == "true") {
        print("response" + responseDecodedMsg.toString());

        final data = responseDecoded['data'];

        for (Map i in data) {
          eventList.add(EventListParser.fromJson(i));

          //TODO: change featured==1, i have done this as no featured items on server
          if (EventListParser.fromJson(i).featured == 0) {
            featuredeventList.add(EventListParser.fromJson(i));
          }
        }

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

  Future GetCategories() async {
    final response = await WebService().GetCategories();

    if (response != "error") {
      this.categoryList.clear();
      var responseDecoded = jsonDecode(response.body);
      var responseDecodedSuccess = responseDecoded['success'];
      var responseDecodedMsg = responseDecoded['message'].toString();

      if (responseDecodedSuccess == false) {
        notifyListeners();
        return responseDecodedMsg;
      } else if (responseDecodedSuccess == true) {
        print("response" + responseDecodedMsg.toString());

        final data = responseDecoded['category_list'];

        for (Map i in data) {
          categoryList.add(CategoryListParser.fromJson(i));
        }

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
