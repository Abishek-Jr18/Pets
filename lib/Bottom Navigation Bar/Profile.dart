import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: size.height*0.2,
                  width: size.width,

                  decoration: BoxDecoration(
                      color: Color(0xD3D3D3FF),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () {
                          _showImagePicker(context);
                        },
                        child:
                            Container(
                              width: size.width * 0.21,
                              height: size.height * 0.10,

                              decoration: BoxDecoration(

                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                image: _imageFile != null
                                    ? DecorationImage(
                                  image: FileImage(_imageFile!),
                                  fit: BoxFit.cover,
                                )
                                    : null
                              ),
                              child: _imageFile == null
                                  ? Center(
                                child: ImageIcon(
                                  AssetImage('assets/icons/camera.png'),
                                  color: Colors.black,
                                  size: 25,
                                ),
                              )
                                  : null,
                            ),

                        ),
                      SizedBox(height: 10), // Spacing between image and text
                      Text(
                        'Abishek Jr',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '8637468480',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),

                    ],
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

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
                leading: ImageIcon(
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
