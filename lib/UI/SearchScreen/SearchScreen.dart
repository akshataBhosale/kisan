import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/UI/DetailedScreens/DetailedFeaturdProducts.dart';
import 'package:kisan/UI/Tabs/HomeTabShreyas.dart';

bool searchResultsProduct = false;
bool searchResultsCompanies = false;
bool searchResultsOffers = false;
bool showSearchMenu = true;

TextEditingController searchController = TextEditingController();

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      showSearchMenu = true;
      searchResultsProduct = false;
      searchResultsCompanies = false;
      searchResultsOffers = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: //SearchResultsProducts(),

            showSearchMenu == true
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        SearchBar(
                          onPressed: () {
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
                                onPressed: () {
                                  print(
                                      "${catItems[index]['text']} is pressed");
                                },
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  )
                : searchResultsProduct == true
                    ? SearchResultsProducts()
                    : searchResultsCompanies == true
                        ? SearchResultsCompanies()
                        : searchResultsOffers == true
                            ? SearchResultsOffers()
                            : Container(),
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
                color: Colors.green, fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
    this.onPressed,
    this.textEditingController,
  }) : super(key: key);

  final Function onPressed;
  final TextEditingController textEditingController;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode focusSearch = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      focusNode: focusSearch,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.arrow_back,
          color: Colors.grey,
          size: 30,
        ),
        hintText: "Search a product or company",
        hintStyle: GoogleFonts.poppins(
            color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w600),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        fillColor: Colors.grey.shade100,
        suffixIconConstraints: BoxConstraints.tightFor(height: 50),
        suffixIcon: GestureDetector(
          onTap: widget.onPressed,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 10),
            child: SvgPicture.asset(
              "assets/icons/searchIcon.svg",
              color: Colors.grey,
            ),
          ),
        ),
      ),
      onEditingComplete: () {
        focusSearch.unfocus();
        if (searchController.text.toString() == "product") {
          setState(() {
            searchResultsProduct = true;

            showSearchMenu = false;
            searchResultsCompanies = false;
            searchResultsOffers = false;
          });
          print(searchResultsProduct);
        } else if (searchController.text.toString() == "company") {
          setState(() {
            searchResultsCompanies = true;

            searchResultsOffers = false;
            showSearchMenu = false;
            searchResultsProduct = false;
          });
          print(searchResultsCompanies);
        } else if (searchController.text.toString() == "offer") {
          setState(() {
            searchResultsOffers = true;

            showSearchMenu = false;
            searchResultsProduct = false;
            searchResultsCompanies = false;
          });
          print(searchResultsOffers);
        } else {
          setState(() {
            showSearchMenu = true;
            searchResultsProduct = false;
            searchResultsCompanies = false;
            searchResultsOffers = false;
          });
          print("else loop");
          print(searchController.text.toString());
        }
      },
      controller: widget.textEditingController,
    );
  }
}

class CategoryGridItems extends StatelessWidget {
  const CategoryGridItems({
    Key key,
    this.title,
    this.imagePath,
    this.onPressed,
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

class SearchResultsProducts extends StatefulWidget {
  @override
  _SearchResultsProductsState createState() => _SearchResultsProductsState();
}

class _SearchResultsProductsState extends State<SearchResultsProducts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          SearchBar(
            onPressed: () {
              print("Search Pressed : ${searchController.text}");
            },
            textEditingController: searchController,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Products",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(COLOR_BACKGROUND),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Companies",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Offers",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Result - 4 Products",
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFF3B3B3B),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 700,
            child: Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: (150 / 180),
              children: [
                GridProds(
                  name: "SAME 325 DFI",
                  desc: "Duetz Fahr",
                  //imgPath: "",
                ),
                GridProds(
                  name: "SAME 325 DFI",
                  desc: "Duetz Fahr",
                ),
                GridProds(
                  name: "SAME 325 DFI",
                  desc: "Duetz Fahr",
                ),
                GridProds(
                  name: "SAME 325 DFI",
                  desc: "Duetz Fahr",
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}

class SearchResultsCompanies extends StatefulWidget {
  @override
  _SearchResultsCompaniesState createState() => _SearchResultsCompaniesState();
}

class _SearchResultsCompaniesState extends State<SearchResultsCompanies> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          SearchBar(
            onPressed: () {
              print("Search Pressed : ${searchController.text}");
            },
            textEditingController: searchController,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Products",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Companies",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(COLOR_BACKGROUND),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Offers",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Result - 2 Companies",
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFF3B3B3B),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 700,
            child: Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: screenWidth,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 1,
                                spreadRadius: 1)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                color: Colors.red[900],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "John Deere",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 15,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "14 products",
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultsOffers extends StatefulWidget {
  @override
  _SearchResultsOffersState createState() => _SearchResultsOffersState();
}

class _SearchResultsOffersState extends State<SearchResultsOffers> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          SearchBar(
            onPressed: () {
              print("Search Pressed : ${searchController.text}");
            },
            textEditingController: searchController,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Products",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Companies",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Offers",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(COLOR_BACKGROUND),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Result - 6 Offers",
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFF3B3B3B),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 700,
            child: Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue[900],
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ],
                            ),
                            margin: EdgeInsets.only(
                                top: getProportionateScreenHeight(10),
                                right: getProportionateScreenHeight(20),
                                bottom: getProportionateScreenHeight(10)),
                            width: getProportionateScreenWidth(172),
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 10, left: 10, child: CompanyName()),
                                Center(
                                  child: Container(
                                      color: Colors.grey,
                                      width: getProportionateScreenWidth(125),
                                      child: Image.asset("")),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "10%",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Discount",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
