import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisan/Helpers/constants.dart' as constants;
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/UI/HomeScreen/HomeScreen.dart';
import 'package:kisan/UI/HomeScreen/HomeScreenShreyas.dart';
import 'package:kisan/UI/HomeScreen/Widgets/bottom_tabs.dart';
import 'package:kisan/UI/Widgets/jumping_dots.dart';
import 'package:kisan/View%20Models/CustomViewModel.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

File imageOne;
bool fetched = false;

class BasicProfile extends StatefulWidget {
  String first_name, last_name, email, image_url, state, city, pincode;

  BasicProfile(this.first_name, this.last_name, this.email, this.image_url,
      this.state, this.city, this.pincode);

  @override
  _BasicProfileState createState() => _BasicProfileState();
}

class _BasicProfileState extends State<BasicProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String pincode;
  int filtersState = -1;
  int filtersDistrict = -1;
  List<String> DistrictList;

  Location location = new Location();
  LocationData _locationData;

  var addresses;
  var first;
  var lat = "";
  var long = "";
  var city = "";
  var state = "";
  var address1 = "";

  bool permission = true;
  final picker = ImagePicker();

  Future Register() {
    Provider.of<CustomViewModel>(context, listen: false)
        .Register(
            firstNameController.text,
            lastNameController.text,
            address1,
            city,
            state,
            long.toString(),
            lat.toString(),
            pincode,
            "otp",
            emailController.text,
            "manual",
            false,
            "mobile")
        .then((value) {
      setState(() {
        if (value == "error") {
          toastCommon(context, "something went wrong");
        } else if (value == "success") {
          push(context, HomeScreen());
        } else {
          toastCommon(context, value);
        }
      });
    });
  }

  Future UpdateProfileData() {
    setState(() {
      if (address1 == "" || address1 == null) {
        address1 = "No Address";
      }
      if (long == null || long == "") {
        long = "0.000000";
        lat = "0.000000";
      }
    });

    Provider.of<CustomViewModel>(context, listen: false)
        .UpdateProfileData(
      firstNameController.text,
      lastNameController.text,
      pincode,
      "otp",
      emailController.text,
      "manual",
      false,
      address1,
      city,
      state,
      long,
      lat,
    )
        .then((value) {
      setState(() {
        if (value == "error") {
          toastCommon(context, "something went wrong");
        } else if (value == "success") {
          toastCommon(context, "Profile Updated");
          pop(context);
          pop(context);
        } else {
          toastCommon(context, value);
        }
      });
    });
  }

  Future getImageOne() async {
    Navigator.of(context).pop();
    var pickedFile = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 25,
    );
    setState(() {
      imageOne = File(pickedFile.path);
      //enableSave = true;
    });
    ImageUpload();
  }

  Future getImageOneGallery() async {
    Navigator.of(context).pop();
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    setState(() {
      imageOne = File(pickedFile.path);
      //enableSave = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("token"));
    ImageUpload();
  }

  Future ImageUpload() async {
    Provider.of<CustomViewModel>(context, listen: false)
        .ImageUpload(imageOne)
        .then((value) async {
      setState(() {
        if (value == "error") {
          toastCommon(context, "Please try again");
        } else if (value == "success") {
          Provider.of<CustomViewModel>(context, listen: false).GetProfileData();
        } else {
          toastCommon(context, value);
        }
      });
    });
  }

  void _settingModalBottomSheetOne(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        getImageOne();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                                //width: 100,
                                child: Icon(
                              Icons.camera_alt,
                              color: Color(0xff007105),
                            )),
                          ),
                          Container(
                              width: 150,
                              child: Text(
                                "Open using camera",
                                style:
                                    GoogleFonts.nunitoSans(letterSpacing: 0.5),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        getImageOneGallery();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                                //width: 100,
                                child: Icon(
                              Icons.image,
                              color: Color(0xff007105),
                            )),
                          ),
                          Container(
                              width: 150,
                              child: Text(
                                "Open using gallery",
                                style:
                                    GoogleFonts.nunitoSans(letterSpacing: 0.5),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      imageOne = null;
      if (widget.city != null) {
        fetched = true;
        city = widget.city;
        state = widget.state;
        pincode = widget.pincode;
      } else {
        fetched = false;
        city = null;
        state = null;
        pincode = null;
      }

      firstNameController.text = widget.first_name;
      lastNameController.text = widget.last_name;
      emailController.text = widget.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final providerListener = Provider.of<CustomViewModel>(context);

    buildTopWidget(BuildContext context) {
      return Container(
          height: screenHeight / 3,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Color(0xff08763F),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenWidth / 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff1F8F4E),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.person,
                        color: Color(COLOR_WHITE),
                      )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Your details",
                      style: GoogleFonts.poppins(
                          fontSize: 22, color: Color(COLOR_WHITE)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => _settingModalBottomSheetOne(context),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage: imageOne == null
                            ? widget.image_url != ""
                                ? NetworkImage(widget.image_url)
                                : AssetImage('assets/images/google.jpg')
                            : FileImage(imageOne),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 95, left: 70),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.yellow,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Icon(Icons.edit,
                                  color: Colors.black, size: 15),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    }

    buildProfileForm(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth / 2.5,
                  child: Theme(
                    data: ThemeData(primaryColor: Color(0xff08763F)),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                            fontSize: 14,
                          )),
                      style: GoogleFonts.poppins(
                          color: Color(0xff08763F),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth / 2.5,
                  child: Theme(
                    data: ThemeData(primaryColor: Color(0xff08763F)),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                          hintText: '  Last Name',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          )),
                      style: GoogleFonts.poppins(
                          color: Color(0xff08763F),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 15, right: screenWidth / 15),
              child: Center(
                child: Container(
                  child: Theme(
                    data: ThemeData(primaryColor: Color(0xff08763F)),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: '  Email',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          )),
                      style: GoogleFonts.poppins(
                          color: Color(0xff08763F),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenWidth / 15, right: screenWidth / 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Location/Address",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Color(0xff696969),
                    ),
                  ),
                  fetched == true
                      ? InkWell(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                border: Border.all(color: Color(0xffCCCCCC))),
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: Color(0xff696969),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              fetched = false;
                              filtersState = -1;
                              filtersDistrict = -1;
                              city = null;
                              state = null;
                              pincode = null;
                            });
                          },
                        )
                      : Container(),
                ],
              ),
            ),
            fetched == true
                ? Container()
                : SizedBox(
                    height: 30,
                  ),
            fetched == true
                ? Container()
                : InkWell(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: screenWidth / 15, right: screenWidth / 15),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xffEBEBEB),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_searching,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Use my device location",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

            /*    fetched == true
                ? Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: screenWidth / 15, right: screenWidth / 15),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff007105)),
                        color: Color(0xff60C164),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Location fetched successfully",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),*/
            fetched == false
                ? SizedBox(
                    height: 20,
                  )
                : SizedBox(
                    height: 1,
                  ),
            fetched == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth / 5,
                        height: 1,
                        color: Color(0xff08763F),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "OR",
                        style: GoogleFonts.poppins(color: Color(0xff08763F)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: screenWidth / 5,
                        height: 1,
                        color: Color(0xff08763F),
                      ),
                    ],
                  )
                : SizedBox(
                    height: 1,
                  ),
            fetched == false
                ? SizedBox(
                    height: 20,
                  )
                : SizedBox(
                    height: 1,
                  ),
            fetched == false
                ? Center(
                    child: Text(
                      "Enter Manually",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 1,
                  ),
            SizedBox(
              height: 3,
            ),
            fetched == false
                ? Center(
                    child: Text(
                      "Applicable for India only",
                      style: GoogleFonts.poppins(
                        color: Color(0xffBCBCBC),
                        fontSize: 10,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 1,
                  ),
            fetched == false
                ? SizedBox(
                    height: 10,
                  )
                : SizedBox(
                    height: 1,
                  ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Material(
                  color: Colors.white,
                  child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              fetched == true
                                  ? Text(
                                      state,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  : Text(
                                      filtersState == -1
                                          ? "Select State"
                                          : StatesListTitles.elementAt(
                                              filtersState),
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.grey.shade600,
                            size: 25,
                          ),
                        ],
                      )),
                ),
              ),
              onTap: () {
                fetched == false ? _showListState(context) : print("feched");
              },
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Material(
                  color: Colors.white,
                  child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              fetched == true
                                  ? Text(
                                      city,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  : Text(
                                      filtersDistrict == -1
                                          ? "Select District"
                                          : DistrictList.elementAt(
                                              filtersDistrict),
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.grey.shade600,
                            size: 25,
                          ),
                        ],
                      )),
                ),
              ),
              onTap: () {
                fetched == false ? _showListDistrict(context) : print("feched");
              },
            ),
            fetched == true
                ? InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Material(
                        color: Colors.white,
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.grey, width: 1),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    pincode,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      fetched == false
                          ? _showListDistrict(context)
                          : print("feched");
                    },
                  )
                : Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Material(
                      color: Colors.white,
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: Colors.grey, width: 1),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              maxLength: 6,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  pincode = value;
                                });
                              },
                              decoration: new InputDecoration(
                                  filled: true,
                                  counterText: "",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintStyle: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                  hintText: "Enter Pincode",
                                  fillColor: Color(COLOR_WHITE)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: getProportionateScreenWidth(258), height: 55),
                child: ElevatedButton(
                  onPressed: () {
                    if (firstNameController.text.length > 0 &&
                        lastNameController.text.length > 0 &&
                        emailController.text.length > 0 &&
                        state != null &&
                        state != "" &&
                        city != null &&
                        city != "" &&
                        pincode != null &&
                        pincode != "") {
                      providerListener.userData == null
                          ? Register()
                          : UpdateProfileData();
                    } else {
                      toastCommon(context, "Please fill all the details");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF008940),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff08763F),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: buildTopWidget(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight / 3),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35)),
                  color: Colors.white),
              child: buildProfileForm(context),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    fetchLocation() async {
      try {
        _locationData = await location.getLocation();
        print(_locationData.toString());
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          setState(() {
            permission = false;
          });
          print("permission value : " + permission.toString());
        } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
          setState(() {
            permission = false;
          });
          print("permission value : " + permission.toString());
        }
      }

      setState(() {
        lat = _locationData.latitude.toString();
        long = _locationData.longitude.toString();
      });

      final coordinates =
          new Coordinates(double.parse(lat), double.parse(long));
      addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);

      first = addresses.first;

      setState(() {
        pincode = first.addressLine.substring(first.addressLine.length - 13);
        pincode = pincode.replaceAll(", India", "");
        print(pincode);
        city = '${first.locality}';
        state = '${first.adminArea}';
        address1 = '${first.addressLine}';

        print("***************");
        print(city + state + address1);
        if (city == "null" ||
            city == null ||
            state == "null" ||
            state == null ||
            pincode == "null" ||
            pincode == "" ||
            pincode == null) {
          fetched = false;
          filtersState = -1;
          filtersDistrict = -1;
          toastCommon(context, "Please Enter manually");
        } else {
          fetched = true;
        }
      });

      //print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');

      Navigator.of(context).pop();
    }

    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Container(
              height: 50,
              width: 50,
              child: Center(child: Image.asset("assets/images/loader.png")))),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.location_on, color: Color(0xff08763F), size: 15),
          Text(
            "Fetching your location",
            style: GoogleFonts.poppins(
              color: Color(0xff08763F),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        fetchLocation();
        return alert;
      },
    );
  }

  _showListState(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Select State',
              style: TextStyle(color: Colors.black),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: StatesListTitles.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      StatesListTitles[index],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        filtersState = index;
                        state = StatesListTitles[index];
                        DistrictList = distList.elementAt(filtersState);
                        filtersDistrict = -1;
                        city = null;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          );
        });
  }

  _showListDistrict(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Select District',
              style: TextStyle(color: Colors.black),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: DistrictList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      DistrictList[index],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        filtersDistrict = index;
                        city = DistrictList[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          );
        });
  }
}
