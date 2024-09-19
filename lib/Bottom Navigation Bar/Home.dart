import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:untitled/Appbar/Notification.dart';
import 'package:untitled/Bottom%20Navigation%20Bar/pet_adoption.dart';
import 'package:untitled/Bottom%20Navigation%20Bar/Profile.dart';

import '../Appbar/Settings.dart';
import '../Widgets/Search.dart';
// Import the flutter_search_bar package

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _greetingMessage = '';

  @override
  void initState() {
    super.initState();
    _setGreetingMessage();
  }

  void _setGreetingMessage() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour < 12) {
      setState(() {
        _greetingMessage = 'Good Morning ☀️';
      });
    } else if (hour < 17) {
      setState(() {
        _greetingMessage = 'Good Afternoon ⛅';
      });
    } else {
      setState(() {
        _greetingMessage = 'Good Evening 🌙';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            // Detect swipe to open drawer
            if (details.delta.dx > 10) {
              Scaffold.of(context).openDrawer();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi\n$_greetingMessage',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            // Updated GestureDetector for search
                            GestureDetector(
                              child: ImageIcon(
                                AssetImage('assets/icons/39.png'),
                                color: Colors.white,
                                size: 27,
                              ),
                              onTap: () {
                                showFloatingSearchBar(context);
                              },
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              child: ImageIcon(
                                AssetImage('assets/icons/58.png'),
                                color: Colors.white,
                                size: 27,
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  // Use TurnPageRoute instead of MaterialPageRoute.
                                  TurnPageRoute(
                                    overleafColor: Colors.grey,
                                    transitionDuration:
                                        const Duration(milliseconds: 300),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 300),
                                    builder: (context) => const notification(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              child: ImageIcon(
                                AssetImage('assets/icons/59.png'),
                                color: Colors.white,
                                size: 28,
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  // Use TurnPageRoute instead of MaterialPageRoute.
                                  TurnPageRoute(
                                    overleafColor: Colors.grey,
                                    transitionDuration:
                                        const Duration(milliseconds: 300),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 300),
                                    builder: (context) => const Settings(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: size.height * 0.24,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.95,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.orange,
                      Colors.purple,
                      Colors.black,
                      Colors.amberAccent,
                      Colors.blueGrey,
                      Colors.grey,
                      Colors.deepOrange,
                      Colors.brown,
                      Colors.lightGreenAccent,
                    ].map((color) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Center(
                                child: Text(
                                  'Images',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: color, // Use color as background
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Content",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),

                  // Expanded widget to contain the ListView.builder
                  Container(
                    height: size.height * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10, // Replace with the actual number of items
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(15.0),
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/sample.jpg'), // Replace with your image asset
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          width: size.width * 0.30,
                          // Adjust height if needed
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Content",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10, // Replace with the actual number of items
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(15.0),
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/sample.jpg'), // Replace with your image asset
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          width: size.width * 0.55,
                          // Adjust height if needed
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 5,
                        left: 5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pet Blogs",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.18,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10, // Replace with the actual number of items
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: AssetImage('assets/icons/pawprint.png'),scale: 18, // Replace with your image asset

                            ),
                          ),
                          width: size.width * 0.48,
                          // Adjust height if needed
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
