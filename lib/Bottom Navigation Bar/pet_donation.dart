import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:turn_page_transition/turn_page_transition.dart';

import '../Appbar/Notification.dart';
import '../Appbar/Settings.dart';

class donation extends StatefulWidget {
  const donation({Key? key}) : super(key: key);

  @override
  State<donation> createState() => _donationState();
}

class _donationState extends State<donation> {
  File? _imageFile; // Variable to hold the selected image file

  // Function to handle image picking from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        _imageFile = null; // Clear the image file if nothing is picked
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(width: 5),
                        ImageIcon(
                          AssetImage('assets/icons/pet.png'),
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Donation',
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
                          GestureDetector(
                            child: ImageIcon(
                              AssetImage('assets/icons/58.png'),
                              color: Colors.white,
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    "Add Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showImagePicker(context);
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: Center(
                            child: ImageIcon(
                              AssetImage('assets/icons/camera.png'),
                              color: _imageFile != null ? Colors.transparent : Colors.white,
                              size: 25,
                            ),
                          ),
                          width: size.width * 0.27,
                          height: size.height * 0.13,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(85)),
                            image: _imageFile != null
                                ? DecorationImage(
                              image: FileImage(_imageFile!),
                              fit: BoxFit.cover,
                            )
                                : DecorationImage(
                              image: AssetImage(
                                'assets/icons/pawprint.png',
                              ), // Placeholder image
                            ),
                          ),
                        ),
                        if (_imageFile != null)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _imageFile = null; // Remove the image
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 12,
                                child: Icon(
                                  Icons.close,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(' Pet Name',style: TextStyle(color: Colors.white),),
                ),
            
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                        hintText: 'Enter Pet Name...',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      ),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      // You can add more properties and configurations as needed
                    ),
                  ),
                ), SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('Name',style: TextStyle(color: Colors.white),),
                ),
            
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                        hintText: 'Enter Your Name...',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      ),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      // You can add more properties and configurations as needed
                    ),
                  ),
                ), SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('Phone Number',style: TextStyle(color: Colors.white),),
                ),
            
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                        hintText: 'Enter Your Phone Number...',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      ),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      // You can add more properties and configurations as needed
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Pet's Age",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                        hintText: "Enter Pet's Age...",
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      ),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      // You can add more properties and configurations as needed
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Details About Your Pet",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: size.height * 0.23,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                        hintText: "Enter Details About Your Pet...",
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      ),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      // You can add more properties and configurations as needed
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Your Address",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: size.height * 0.11,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                        hintText: " Enter Your Address...",
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      ),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      // You can add more properties and configurations as needed
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: size.height * 0.065,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Color(0xD3D3D3FF),
                          borderRadius: BorderRadius.all(
                              Radius.circular(15))),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16,color: Colors.white
                          )
                        ),
                      ),
                    ),
                  ),
                  onTap: () {


                  },
                ),
            
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show image picker options (gallery or camera)
  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Color(0xFFFFFFFF),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: ImageIcon(
                  AssetImage('assets/icons/pawprint.png'),
                  color: Colors.black,
                  size: 20,
                ),
                title: Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading:  ImageIcon(
                  AssetImage('assets/icons/camera.png'),
                  color: Colors.black,
                  size: 25,
                ),
                title: Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
