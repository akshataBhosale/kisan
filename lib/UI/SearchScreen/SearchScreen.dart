import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/size_config.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<Map<String, dynamic>> catItems = [
      {
        "imgPath": "assets/images/catImages/plant.png",
        "text": "Seeds & planting Material",
        "onPressed": () {},
      },
      {
        "imgPath": "assets/images/catImages/fertilizers.png",
        "text": "Fertilizer",
        "onPressed": () {},
      },
      {
        "imgPath": "assets/images/catImages/blueBarrel.png",
        "text": "Agro-Chemicals ",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/sprinklers.png",
        "text": "Irrigation ",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/leaves.png",
        "text": "Protective films & nets ",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/GreenTractor.png",
        "text": "Machinery",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/tools.png",
        "text": "Tools",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/drone.png",
        "text": "Automation ",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/apple-logo.png",
        "text": "Packaging",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/truck.png",
        "text": "Transport ",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/trailor.png",
        "text": "Storage",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/solar.png",
        "text": "Energy",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/greens.png",
        "text": "Post harvest",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/cow.png",
        "text": "Animal Husbandry",
        "onPressed": () {}
      },
      {
        "imgPath": "assets/images/catImages/book.png",
        "text": "Books & Magazines",
        "onPressed": () {}
      },
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              SearchBar(
                onPressed: (){
                  print("Search Pressed : ${searchController.text}");
                },
                textEditingController: searchController,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Recent searches",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFF3B3B3B),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                padding: EdgeInsets.symmetric(horizontal: 11),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFF0FFF7)),
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Color(0xFF3DA86F).withOpacity(0.2),
                      thickness: 2,
                      height: getProportionateScreenHeight(28),
                    );
                  },
                  itemBuilder: (context, index) {
                    return RecentSearch();
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Categories",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFF3B3B3B),
                    fontWeight: FontWeight.w500),
              ),
              Container(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  children: List.generate(catItems.length, (index) {
                    return CategoryGridItems(
                      title: catItems[index]['text'],
                      imagePath: catItems[index]['imgPath'],
                      onPressed: (){
                        print("${catItems[index]['text']} is pressed");
                      },
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecentSearch extends StatelessWidget {
  const RecentSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/searchIcon.svg",
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Tractor mounted plough",
            style: GoogleFonts.poppins(
                color: Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key, this.onPressed, this.textEditingController,
  }) : super(key: key);

  final Function onPressed;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 14),
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
            size: 30,
          ),
          hintText: "Search a product or company",
          hintStyle: GoogleFonts.poppins(
              color: Colors.grey[400],
              fontSize: 14,
              fontWeight: FontWeight.w600),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          fillColor: Colors.grey.shade100,
          suffixIconConstraints: BoxConstraints.tightFor(height: 50),
          suffixIcon: GestureDetector( onTap: onPressed,
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 10),
              child: SvgPicture.asset(
                "assets/icons/searchIcon.svg",
                color: Colors.grey,
              ),
            ),
          )),
      controller: textEditingController,
    );
  }
}

class CategoryGridItems extends StatelessWidget {
  const CategoryGridItems({
    Key key,
    this.title,
    this.imagePath, this.onPressed,
  }) : super(key: key);

  final String title, imagePath;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 53,
              width: 51,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                  image: DecorationImage(image: AssetImage(imagePath))),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 9,
                color: Colors.grey[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
