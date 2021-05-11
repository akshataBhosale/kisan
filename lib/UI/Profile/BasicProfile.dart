import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisan/Helpers/constants.dart' as constants;
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/UI/HomeScreen/HomeScreen.dart';
import 'package:kisan/UI/HomeScreen/Widgets/bottom_tabs.dart';
import 'package:kisan/UI/Widgets/jumping_dots.dart';
import 'package:location/location.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:kisan/Helpers/size_config.dart';

File imageOne;
bool fetched = false;

class BasicProfile extends StatefulWidget {
  @override
  _BasicProfileState createState() => _BasicProfileState();
}

class _BasicProfileState extends State<BasicProfile> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Location location = new Location();
  LocationData _locationData;

  var addresses;
  var first;
  var lat;
  var long;
  var city; var state;

  bool permission = true;
  final picker = ImagePicker();
  Future getImageOne() async {
    Navigator.of(context).pop();
    var pickedFile = await picker.getImage(source: ImageSource.camera, imageQuality: 25,);
    setState(() {
      imageOne = File(pickedFile.path);
      //enableSave = true;
    });
  }
  Future getImageOneGallery() async {
    Navigator.of(context).pop();
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 25,);
    setState(() {
      imageOne = File(pickedFile.path);
      //enableSave = true;
    });
  }

  void _settingModalBottomSheetOne(context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc){
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
                      onTap: (){
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
                                child: Icon(Icons.camera_alt, color: Color(0xff007105),)),
                          ),
                          Container(
                              width: 150,
                              child: Text("Open using camera",
                                style: GoogleFonts.nunitoSans(
                                    letterSpacing: 0.5
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: InkWell(
                      onTap: (){
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
                                child: Icon(Icons.image, color: Color(0xff007105),)),
                          ),
                          Container(
                              width: 150,
                              child: Text("Open using gallery",
                                style: GoogleFonts.nunitoSans(
                                    letterSpacing: 0.5
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetched = false;
      imageOne = null;
      city = null; state = null;
    });
    firstNameController = TextEditingController(text: "  Shreyas");
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    buildTopWidget(BuildContext context){
      return Container(
          height: screenHeight/3,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Color(0xff08763F),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(margin: EdgeInsets.only(left: screenWidth/15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff1F8F4E),
                      ),
                      child: Center(child:
                      Icon(Icons.person,color: Color(constants.COLOR_WHITE),)),
                    ),
                    SizedBox(width: 20,),
                    Text("Your details",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Color(constants.COLOR_WHITE)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () => _settingModalBottomSheetOne(context),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage: imageOne == null ? AssetImage("assets/images/google.jpg") : FileImage(imageOne),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 95, left: 70),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 30, width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.yellow,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Icon(Icons.edit, color: Colors.black, size: 15),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      );
    }

    buildProfileForm(BuildContext context){
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth/2.5,
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Color(0xff08763F)
                    ),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                            fontSize: 14,
                          )
                      ),
                      style: GoogleFonts.poppins(
                        color: Color(0xff08763F),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth/2.5,
                  child: Theme(
                    data: ThemeData(
                        primaryColor: Color(0xff08763F)
                    ),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                          hintText: '  Last Name',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          )
                      ),
                      style: GoogleFonts.poppins(
                          color: Color(0xff08763F),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
            fetched == true ? SizedBox(height: 30,) : Container(),
            fetched == true ? Padding(
              padding: EdgeInsets.only(left: screenWidth/15, right: screenWidth/15),
              child: Center(
                child: Container(
                  child: Theme(
                    data: ThemeData(
                        primaryColor: Color(0xff08763F)
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: '  Email',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          )
                      ),
                      style: GoogleFonts.poppins(
                          color: Color(0xff08763F),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ) : Container(),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: screenWidth/15, right: screenWidth/15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Location/Address",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color(0xff696969),
                    ),
                  ),
                  fetched == true ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: Color(0xffCCCCCC))
                    ),
                    child: Center(
                      child: Icon(Icons.edit, color: Color(0xff696969),),
                    ),
                  ) : Container(),
                ],
              ),
            ),
            fetched == true ? Container() : SizedBox(height: 30,),
            fetched == true ? Container() : InkWell(
              onTap: (){
                showAlertDialog(context);
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: screenWidth/15, right: screenWidth/15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffEBEBEB),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_searching, color: Colors.black,),
                      SizedBox(width: 10,),
                      Text("Use my device location",
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
            fetched == true ? SizedBox(height: 30,) : Container(),
            fetched == true ? Center(
              child: Container(
                margin: EdgeInsets.only(left: screenWidth/15, right: screenWidth/15),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff007105)),
                  color: Color(0xff60C164),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Location fetched successfully",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ) : Container(),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth/5,
                  height: 1,
                  color: Color(0xff08763F),
                ),
                SizedBox(width: 10,),
                Text("OR",
                  style: GoogleFonts.poppins(color: Color(0xff08763F)),
                ),
                SizedBox(width: 10,),
                Container(
                  width: screenWidth/5,
                  height: 1,
                  color: Color(0xff08763F),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Center(
              child: Text("Enter Manually",
                style: GoogleFonts.poppins(
                    color: Color(0xff696969),
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 3,),
            Center(
              child: Text("Applicable for India only",
                style: GoogleFonts.poppins(
                  color: Color(0xffBCBCBC),
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(left: screenWidth/15, right: screenWidth/15),
              child: SearchableDropdown.single(
                  isExpanded: true,
                  onChanged: (val){
                    setState(() {
                      state = val.toString();
                    });print("State : " + state);
                  },
                  items: ['Maharashtra','Karnataka'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(
                        value,
                      ),
                    );
                  }).toList(),
                  value: state == null ? "Select state" : state,
                  hint: Text("Select state",
                    style: GoogleFonts.poppins(color: Color(0xff696969)),
                  ),
                  searchHint: Text("Select state",
                    style: GoogleFonts.poppins(color: Color(0xff696969),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: screenWidth/15, right: screenWidth/15),
              child: SearchableDropdown.single(
                isExpanded: true,
                onChanged: (val){
                  setState(() {
                    city = val.toString();
                  });
                  print("City : " + city);
                },
                items: ['Pune','Satara'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(
                      value,
                    ),
                  );
                }).toList(),
                value: city == null ? "Select city" : city,
                hint: Text("Select city",
                  style: GoogleFonts.poppins(color: Color(0xff696969)),
                ),
                searchHint: Text("Select city",
                  style: GoogleFonts.poppins(color: Color(0xff696969),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: getProportionateScreenWidth(258),
                    height: 55),
                child: ElevatedButton(
                  onPressed: () {
                    push(context, HomeScreen());
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
            SizedBox(height: 30,),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff08763F),
      body: Stack(
        children: [
          Positioned(
            top: 0,left: 0,right: 0,
            child: buildTopWidget(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight/3),
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
        lat = _locationData.latitude;
        long = _locationData.longitude;
      });

      final coordinates = new Coordinates(lat, long);
      addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

      first = addresses.first;

      setState(() {
        city ='${first.locality}';
        state = '${first.adminArea}';
        fetched = true;
      });

      //print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');

      print("City : " + city);
      print("State : " + state);

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
      title: Center(child: Container(
          height: 50, width: 50,
          child: Center(child: Image.asset("assets/images/loader.png")))),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.location_on, color: Color(0xff08763F), size: 15),
          Text("Fetching your location",
            style: GoogleFonts.poppins(
              color: Color(0xff08763F),
              fontSize: 18,fontWeight: FontWeight.w500,
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

}
