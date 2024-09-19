import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:untitled/Bottom%20Navigation%20Bar/Profile.dart';
import 'package:untitled/Bottom%20Navigation%20Bar/pet_donation.dart';

import 'Bottom Navigation Bar/Home.dart';
import 'Bottom Navigation Bar/pet_adoption.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0; // Index for bottom navigation bar

  // Screens for bottom navigation bar
  final List<Widget> _screens = [
    Home(),
    adoption(),
    donation(),
    Profile(),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => ClipRRect(

        child: AlertDialog(
          backgroundColor: Color(0xFF656565),
          title: Text('Exit App', style: TextStyle(color: Colors.black)),
          content: Text('Do you want to exit the app?', style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    )) ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Drawer(
              backgroundColor: Colors.transparent,
              // Define your drawer content here
              child: ListView(
                padding: EdgeInsets.only(),
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFFECB2B2FF),
                    ),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Item 1',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle drawer item tap
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Item 2',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle drawer item tap
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: SalomonBottomBar(
              backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                SalomonBottomBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/57.png'),
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text('Home'),
                  selectedColor: Colors.deepOrange,
                ),
                SalomonBottomBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/pet (1).png'),
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text('Pets Adoption'),
                  selectedColor: Colors.amber,
                ),
                SalomonBottomBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/pet.png'),
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text('Pets Donation'),
                  selectedColor: Colors.red,
                ),
                SalomonBottomBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/59.png'),
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text('Profile'),
                  selectedColor: Colors.lightGreenAccent,
                ),
              ],
            ),
          ),
        ),
        body: _screens[_currentIndex],
      ),
    );
  }
}
