import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/UI/CompanyProfile/CompanyProfile.dart';
import 'package:kisan/UI/DetailedScreens/DetailedProducts.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sonalika Tiger 26 has a Single Clutch, which "
              "provides smooth and easy functioning. Sonalika Tiger "
              "26 steering type is Hydrostatic from that tractor get "
              "easy to control and fast response. The tractor has "
              "Multi Disc/Oil Immersed Brakes (optional) which provide "
              "high grip and low slippage. It has a heavy hydraulic lifting "
              "capacity and Sonalika Tiger 26 mileage is economical "
              "in every field and has a liters fuel tank capacity. \n"
              "\nAdditionally, Sonalika Tiger 26 comes with 8 Forward "
              "+ 2 Reverse gearboxes which provides comfort while "
              "driving the tractor.",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                color: Colors.black,fontSize: 14
            ),),
          SizedBox(height: 30,),

          //Images Section
          HeaderTexts(title: 'Images',),
          Container(
            height: 122,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(top: 20,bottom: 20,right: 20),
                    height: 82,
                    width: 82,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green
                    ),
                  );
                }),
          ),
          SizedBox(height: 36,),
          //Pdfs section
          HeaderTexts(title: "Brochures",),
          SizedBox(height: 15,),
          PDFButton(),
          SizedBox(height: 26,),
          PDFButton(),
          SizedBox(height: 90,)

        ],
      ),
    );
  }
}
