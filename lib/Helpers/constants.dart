library constants;

import 'package:flutter/material.dart';

const FINISHED_ON_BOARDING = 'finishedOnBoarding';
const COLOR_ACCENT = 0xFF3d8ddb;
const COLOR_PRIMARY_DARK = 0xFF1976D2;
const COLOR_BACKGROUND = 0xff008940;
const COLOR_BACKGROUND_OPPOSITE = 0xFF000000;
const COLOR_PRIMARY = 0xff1976D2;
const COLOR_WHITE = 0xFFffffff;
const COLOR_TEXT_BLACK = 0xFF000000;
const COLOR_TEXT_WHITE = 0xFFFFFFFF;
const COLOR_TEXT_GREY = 0xFFC0C0C0;

const COLOR_BLUE = 0xFF4285F4;
const COLOR_RED = 0xFFEA4335;
const COLOR_YELLOW = 0xFFFBBC05;
const COLOR_GREEN = 0xFF34A853;
const COLOR_YELLO_GREEN = 0xFFBEC100;
const COLOR_YELLO_LEMON = 0xFFfff44f;
const COLOR_TEXT_GREEN = 0xffFF094409;

const ANIMATION_DURATION = 260;

const APP_TITLE = 'Kisan';
const APP_SUBTITLE = 'Kisan App';
const APP_LOGO_PATAH = 'assets/logo.png';
const ASSET_PATAH = 'assets/';
const API_KEY = "";
const currencySymbl = "\₹";
const client_id = "1c714eee-0db2-431a-a941-9b27b2c4d64b";
const client_secret = "61678097-4baa-472c-9fa7-ea628a5d2675";

// mainurl
const apiUrl = "https://id.kisanlab.com";
const send_custom_otp_mobile = apiUrl + "/profiles/send_custom_otp_mobile/";
const api_token_custom_otp_auth = apiUrl + "/api-token-custom-otp-auth/";
const profiles = apiUrl +
    "/profiles/"; //same api can be used for getting user details and updating details
const register = apiUrl + "/register/";
const image_upload = apiUrl + "/image_upload/";

/*
List<Map<String, dynamic>> drawerItems = [
  {
    "icon": Icons.calendar_today_rounded,
    "text": "My Webinars",
    "onPressed": () {},
  },
  {
    "icon": Icons.settings,
    "text": "Settings",
    "onPressed": () {},
  },
  {"icon": Icons.share, "text": "Invite Friends", "onPressed": () {}},
  {"icon": Icons.error, "text": "FAQ & Support", "onPressed": () {}},
  {"icon": Icons.error, "text": "About App", "onPressed": () {}},
  {
    "icon": Icons.privacy_tip_rounded,
    "text": "Terms & Privacy Policy",
    "onPressed": () {}
  },
  {"icon": Icons.logout, "text": "Logout", "onPressed": () {}}
];*/

List<Map<String, String>> imgSlider = [
  {
    "imgPath": "assets/images/ruralfirst.jpg",
  },
  {
    "imgPayh": "assets/images/tractor2.jpg",
  },
];
