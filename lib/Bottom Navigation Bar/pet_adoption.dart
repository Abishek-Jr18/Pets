import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:untitled/Appbar/Notification.dart';

import '../Appbar/Settings.dart';
import 'Profile.dart';

class adoption extends StatefulWidget {
  const adoption({super.key});

  @override
  State<adoption> createState() => _adoptionState();
}

class _adoptionState extends State<adoption> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
                  children: [
                    Row(
                      children: [
                        Text(
                          'Pets',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5,),
                        ImageIcon(
                          AssetImage('assets/icons/pet (1).png'),
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'Adoption',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Row(
                        children: [
                          // Updated GestureDetector for search
            
                          GestureDetector(
                            child: ImageIcon(
                              AssetImage('assets/icons/58.png'),
                              color: Colors.white,
                              size: 25,
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
                              size: 25,
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
                SizedBox(height: 20,),
            
            
                Container(
                  height: size.height*0.1,
                  width: size.width,
            
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(15.0),
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/sample.jpg'), // Replace with your image asset
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
            
            
            
                // Slogan about pet adoption
            
            
            
                SizedBox(height: 5,),
            
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                    left: 8
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pets",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      // Text(
                      //   "See all",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 13),
                      // )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
            Container(
            
              height: size.height * 0.12,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  // List of animal names
                  final List<String> animalNames = [
            
                    "Dinosaur",
                    "Lion",
                    "Dog",
                    "Parrot",
                    "Hamster",
                    "Cat",
                    "Elephant",
                    "Giraffe",
                    "Penguin",
                    "Dolphin"
                  ];
            
                  return Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.pets,
                              color: Colors.grey ,
                            ),
                          ),
                          onTap: (){},
                        ),
                        SizedBox(height: 3,),
                        Container(
            
                          width: 70, // Adjust the width to fit your design
                          child: Center(
                            child: Text(
                              animalNames[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
                SizedBox(height: 15,),
            
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5,
                      left: 5
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Available Pets",
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


              height: size.height * 0.305,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                // Set scroll direction to vertical
                itemCount: 10, // Replace with the actual number of items
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width * 0.93,
                    height: size.height * 0.25,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage('assets/icons/pet.png'),scale: 5, // Replace with your image asset

                      ),
                    ),
                // Adjust height if needed
                  );
                },
              ),
            ),

                SizedBox(height: 15,),

                Padding(
                  padding: const EdgeInsets.only(
                      right: 5,
                      left: 5
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pet Care",
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
                            image: AssetImage('assets/icons/stethoscope.png'),scale: 11, // Replace with your image asset

                          ),
                        ),
                        width: size.width * 0.48,
                        // Adjust height if needed
                      );
                    },
                  ),
                ),  SizedBox(height: 15,),

                Padding(
                  padding: const EdgeInsets.only(
                      right: 5,
                      left: 5
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Community Care",
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
                            image: AssetImage('assets/icons/dog-food.png'),scale: 12, // Replace with your image asset

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
    );
  }
}
