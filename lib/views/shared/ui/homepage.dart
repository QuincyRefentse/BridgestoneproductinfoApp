import 'dart:async';

import 'package:bsafproductinfo/views/shared/appstyle.dart';
import 'package:bsafproductinfo/views/shared/cartyre_product_card.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  Timer? _scrollTimer;
  late final TabController _tabController =
      TabController(length: 4, vsync: this);

  bool _scrollingRight = true;

  @override
  void initState() {
    super.initState();
    // Start the timer to scroll the ListView every 5 seconds
    _scrollTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_scrollingRight) {
        _scrollToRight();
      } else {
        _scrollToLeft();
      }
    });
  }

  void _scrollToRight() {
    double newPosition =
        _controller.offset + MediaQuery.of(context).size.width * 0.6;
    if (newPosition > _controller.position.maxScrollExtent) {
      // If the new position exceeds the maximum scroll extent,
      // set the new position to the maximum extent and reverse the scrolling direction
      newPosition = _controller.position.maxScrollExtent;
      _scrollingRight = false;
    }

    _controller.animateTo(
      newPosition,
      duration: Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }

  void _scrollToLeft() {
    double newPosition =
        _controller.offset - MediaQuery.of(context).size.width * 0.6;
    if (newPosition < _controller.position.minScrollExtent) {
      // If the new position goes below the minimum scroll extent,
      // set the new position to the minimum extent and reverse the scrolling direction
      newPosition = _controller.position.minScrollExtent;
      _scrollingRight = true;
    }

    _controller.animateTo(
      newPosition,
      duration: Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }

/*
  @override
  void initState() {
    super.initState();
    // Start the timer to scroll the ListView every 5 seconds
    _scrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      _scrollToRight();
    });
  }
*/
  @override
  void dispose() {
    _scrollTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

/*
  void _scrollToRight() {
    _controller.animateTo(
      _controller.offset + MediaQuery.of(context).size.width * 0.6,
      duration: Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xF6E8E8E8),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_imageB.png"),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 8, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Our Tyre ",
                        style: appstyleWithHt(
                            42, Colors.white, FontWeight.bold, 1.5),
                      ),
                      Text(
                        "Collection",
                        style: appstyleWithHt(
                            42, Colors.white, FontWeight.bold, 1.2),
                      ),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              appstyle(24, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.white.withOpacity(0.5),
                          tabs: const [
                            Tab(
                              text: "Car tyres",
                            ),
                            Tab(
                              text: " trucks tyres",
                            ),
                            Tab(
                              text: " Truck and Bus tyres",
                            ),
                            Tab(
                              text: " Industrial tyres",
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.265),
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            //width: MediaQuery.of(context).size.width * 0.405,
                            height: MediaQuery.of(context).size.height * 0.405,

                            child: ListView.builder(
                                itemCount: 6,
                                controller: _controller,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                    //price: "\R2000",
                                    category: "Potenza",

                                    id: "820570",
                                    image:
                                        "assets/images/BS_Potenza-S005_3-4_1r.png",
                                    description:
                                        'Information about the tyre here',
                                    brand: '',
                                    materialcode: "808500",
                                    LI_SI: '',
                                    inch: "15",
                                    size: '8.25R15',
                                    pattern: '',
                                    fitmentmake_and_model: '',
                                    LI_SS: '',
                                    rimInches: '',
                                    REP_WAR: '',
                                    tyreSize: '',
                                    XL: '',
                                    RFT: '',
                                    TDG: '',
                                    segment: '',
                                  );
                                }),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 20, 12, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Latest Tyres",
                                      style: appstyle(
                                          24, Colors.black, FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Show All",
                                          style: appstyle(22, Colors.black,
                                              FontWeight.w500),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          size: 50,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 0.8,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors.black.withOpacity(0.1),
                                          // Set the border color to black with opacity 0.1
                                          width:
                                              1, // Set the width of the border
                                        ),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: Image.asset(
                                          'assets/images/MicrosoftTeams-image (7).png'),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.405,
                          color: Colors.green,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.405,
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.405,
                          color: Colors.pink,
                        )
                      ],
                    ),

                  ]),
                ),
              ),
              Positioned(
                top: -20,
                left: 120,
                right: 120,
                //bottom: 0,
                child: Image.asset(
                  'assets/images/Bridgestone Logo White.png',
                  // Replace with the actual path to your image
                  width: 130, // Set the width of the image
                  height: 100, // Set the height of the image
                ),
              ),
            ],
          ),
        ));
  }
}
