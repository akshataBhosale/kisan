import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kisan/Helpers/constants.dart' as constants;
import 'package:kisan/Helpers/images.dart' as images;
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import '../../Helpers/helper.dart';
import 'LoginWithOTP.dart';
import 'package:kisan/utils/authentication.dart';

class SocialAuth extends StatefulWidget {
  @override
  _SocialAuthState createState() => _SocialAuthState();
}

class _SocialAuthState extends State<SocialAuth> {
  var googleEmail;
  var googleName;
  var googleAuthId;
  var server_key =
      "379951119240-tkmkpj996t81g2kqn9qbvdblbht3c8n9.apps.googleusercontent.com";
<<<<<<< HEAD


=======
>>>>>>> shreyas

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile',
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      await googleSignIn.signIn().then((value) {
        setState(() {
          googleEmail = googleSignIn.currentUser.email;
          googleName = googleSignIn.currentUser.displayName;
          googleAuthId = googleSignIn.currentUser.id;

          print(googleEmail + " " + googleAuthId);

          value.authentication.then((googleKey) {
            print(googleKey.accessToken);
            print("token: " + googleKey.idToken);
          }).catchError((err) {
            print('inner error');
          });
        });
      });
    } catch (error) {
      print(error);
      _handleSignOut();
    }

   /* GoogleOAuth2Client client = GoogleOAuth2Client(
      customUriScheme: 'my.test.app', //Must correspond to the AndroidManifest's "android:scheme" attribute
      redirectUri: 'my.test.app:/oauth2redirect', //Can be any URI, but the scheme part must correspond to the customeUriScheme
    );

    OAuth2Helper oauth2Helper = OAuth2Helper(client,
        grantType: OAuth2Helper.AUTHORIZATION_CODE,
        clientId: '379951119240-tkmkpj996t81g2kqn9qbvdblbht3c8n9.apps.googleusercontent.com',
        clientSecret: 'NCAldTqtQigRoqqmR_LbFyTf',
        scopes: ['https://www.googleapis.com/auth/drive.readonly']);

    print(oauth2Helper.getToken());*/

  }

  Future<void> _handleSignOut() => googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    buildTopWidget(BuildContext context) {
      return Container(
          height: screenHeight / 6,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Color(0xff08763F),
          ),
          child: Container(
              alignment: Alignment.centerLeft,
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
                      Icons.exit_to_app,
                      color: Color(constants.COLOR_WHITE),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Sign up/ Login",
                    style: GoogleFonts.poppins(
                        fontSize: 22, color: Color(constants.COLOR_WHITE)),
                  ),
                ],
              )));
    }

    buildLanguagaeWidget(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight / 6),
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
              color: Color(constants.COLOR_WHITE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Stack(
            children: [
              Positioned(
                top: screenHeight / 20,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Welcome\nLet's get you started!",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    style: GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight / 5,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          push(context, LoginWithOTP());
                        },
                        child: Container(
                            height: 60,
                            width: screenWidth / 1.3,
                            decoration: BoxDecoration(
                              color: Color(constants.COLOR_BACKGROUND),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  height: 55,
                                  width: 55,
                                  color: Colors.white,
                                  child: Center(
                                    child: Icon(
                                      Icons.mobile_friendly_outlined,
                                      color: Color(constants.COLOR_BACKGROUND),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Enter using Mobile",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth / 3,
                            height: 1,
                            color: Colors.grey[300],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "OR",
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: screenWidth / 3,
                            height: 1,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FutureBuilder(
                        future:
                            Authentication.initializeFirebase(context: context),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error initializing Firebase');
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return GoogleSignInButton();
                          }
                          return CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orange,
                            ),
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {
                          _handleSignIn();
                        },
                        child: Container(
                            height: 60,
                            width: screenWidth / 1.3,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  height: 55,
                                  width: 55,
                                  color: Colors.white,
                                  child: Center(
                                    child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(images.googleLogo)),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Sign up with Google",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth / 3,
                            height: 1,
                            color: Colors.grey[300],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "OR",
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: screenWidth / 3,
                            height: 1,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 60,
                          width: screenWidth / 1.3,
                          decoration: BoxDecoration(
                            color: Color(constants.COLOR_BACKGROUND_OPPOSITE),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 55,
                                width: 55,
                                color: Colors.white,
                                child: Center(
                                  child: Container(
<<<<<<< HEAD
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(images.appleLogo)),
                                ),
=======
                                      height: 30,width: 30,
                                      child: Image.asset("assets/images/apple-logo.png")),),
>>>>>>> shreyas
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Sign up with Apple",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
          buildLanguagaeWidget(context),
        ],
      ),
    );
  }
}

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                User user =
                    await Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {
                  print("*************");
                  print(user.uid);
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
