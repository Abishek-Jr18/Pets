import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:rive/rive.dart';

import 'Basepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(


  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Anime(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}

class Anime extends StatefulWidget {
  const Anime({super.key});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {
  bool _isBottomSheetShown = false;

  void _showBottomSheet() {
    Size size = MediaQuery.of(context).size;
    TextEditingController phoneNumber = TextEditingController(); TextEditingController otp = TextEditingController();
    TextEditingController phoneNumber1 = TextEditingController();
    TextEditingController password1 = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    PageController _pageController = PageController(initialPage: 0);

    if (!_isBottomSheetShown) {
      setState(() {
        _isBottomSheetShown = true;
      });

      int currentPage = 1; // Track current page of PageView

      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                height: 500,
                width: size.width,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  children: [
                    // First page
                    SingleChildScrollView(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text("Create your Account",
                                      style: TextStyle(fontSize: 20))),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Name",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: size.height * 0.07,
                                  width: size.width,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF7F7F7),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: TextFormField(
                                          controller: name,
                                          maxLength: 10,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          decoration: const InputDecoration(
                                              hintText: " Enter Your Name",
                                              hintStyle: TextStyle(
                                                fontFamily: 'poppins',
                                                color: Color(0xFFA5A5A5),
                                                fontSize: 14,
                                              ),
                                              border: InputBorder.none,
                                              counterText: ""),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " Phone Number",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: size.height * 0.07,
                                  width: size.width,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF7F7F7),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: TextFormField(
                                          controller: phoneNumber,
                                          maxLength: 10,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          decoration: const InputDecoration(
                                              hintText:
                                                  " Enter Your Phone Number",
                                              hintStyle: TextStyle(
                                                fontFamily: 'poppins',
                                                color: Color(0xFFA5A5A5),
                                                fontSize: 14,
                                              ),
                                              border: InputBorder.none,
                                              counterText: ""),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Email",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: size.height * 0.07,
                                  width: size.width,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF7F7F7),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: TextFormField(
                                          controller: email,
                                          maxLength: 10,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          decoration: const InputDecoration(
                                              hintText:
                                                  " Enter Your Email Address",
                                              hintStyle: TextStyle(
                                                fontFamily: 'poppins',
                                                color: Color(0xFFA5A5A5),
                                                fontSize: 14,
                                              ),
                                              border: InputBorder.none,
                                              counterText: ""),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Password",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: size.height * 0.07,
                                  width: size.width,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF7F7F7),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: TextFormField(
                                          controller: password,
                                          maxLength: 10,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          decoration: const InputDecoration(
                                              hintText: " Enter Your Password",
                                              hintStyle: TextStyle(
                                                fontFamily: 'poppins',
                                                color: Color(0xFFA5A5A5),
                                                fontSize: 14,
                                              ),
                                              border: InputBorder.none,
                                              counterText: ""),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have An Account?"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                        color: Color(0xFF9C9CFF),
                                      ),
                                    ),
                                    onTap: () {
                                      // Navigate to the second page
                                      _pageController.animateToPage(
                                        1,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOutExpo,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Center(
                                child: InkWell(
                                  child: Container(
                                    height: size.height * 0.06,
                                    width: size.width * 0.50,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Center(
                                      child: Text(
                                        'Get OTP',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    // Navigate to the second page
                                    _pageController.animateToPage(
                                      2,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOutExpo,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    )),

                    // Second page
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Center(
                              child: Text("Log into our App",
                                  style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Phone Number",
                                  style: TextStyle(fontSize: 13)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                height: size.height * 0.07,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7F7F7),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: TextFormField(
                                        controller: phoneNumber1,
                                        maxLength: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: " Enter Your Phone Number",
                                          hintStyle: TextStyle(
                                            fontFamily: 'poppins',
                                            color: Color(0xFFA5A5A5),
                                            fontSize: 14,
                                          ),
                                          border: InputBorder.none,
                                          counterText: "",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Password",
                                  style: TextStyle(fontSize: 13)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                height: size.height * 0.07,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7F7F7),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: TextFormField(
                                        controller: password1,
                                        maxLength: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: " Enter Your Password",
                                          hintStyle: TextStyle(
                                            fontFamily: 'poppins',
                                            color: Color(0xFFA5A5A5),
                                            fontSize: 14,
                                          ),
                                          border: InputBorder.none,
                                          counterText: "",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Add other fields similarly
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't Have an Account?"),
                                SizedBox(width: 5),
                                InkWell(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(color: Color(0xFF9C9CFF)),
                                  ),
                                  onTap: () {
                                    // Navigate to the second page
                                    _pageController.animateToPage(
                                      0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOutExpo,
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 35),
                            Center(
                              child: InkWell(
                                child: Container(
                                  height: size.height * 0.06,
                                  width: size.width * 0.50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Get OTP',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),

                                  onTap: () {
                                    // Navigate to the second page
                                    _pageController.animateToPage(
                                      2,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOutExpo,
                                    );

                                },
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Center(
                              child: Text('OTP Verificaton',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Center(
                                child: Text(
                                  'Please Enter The 5 Digit OTP',
                                  style: TextStyle(

                                    color: Color(0xFFA5A5A5),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 80),

                            Center(
                              child: Pinput(
                                controller: otp,
                                defaultPinTheme: PinTheme(
                                  height: size.height * 0.065,
                                  width: size.width * 0.135,
                                  textStyle: const TextStyle(
                                    letterSpacing: 0.60,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    shape: BoxShape.rectangle,
                                    color: Colors.black,

                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.done,
                                length: 5,
                              ),
                            ),

                            // Add other fields similarly
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("DId not Recevied OTP?"),
                                SizedBox(width: 5),
                                InkWell(
                                  child: Text(
                                    "Get Otp",
                                    style: TextStyle(color: Color(0xFF9C9CFF)),
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(height: 35),
                            Center(
                              child: InkWell(
                                child: Container(
                                  height: size.height * 0.06,
                                  width: size.width * 0.50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Enter',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  Get.to(Homepage());
                                },
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),




                  ],
                ),
              ),
            ),
          );
        },
      ).whenComplete(() {
        setState(() {
          _isBottomSheetShown = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.50,
              width: size.width,
              child: RiveAnimation.asset('assets/phone_girl.riv'),
            ),
            SizedBox(
              height: 150,
            ),
            BlinkingCircle(onTap: _showBottomSheet),
          ],
        ),
      ),
    );
  }
}

class BlinkingCircle extends StatefulWidget {
  final VoidCallback onTap;

  BlinkingCircle({required this.onTap});

  @override
  _BlinkingCircleState createState() => _BlinkingCircleState();
}

class _BlinkingCircleState extends State<BlinkingCircle>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blinkAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _blinkAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 1000),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            border: Border.all(
              width: 3,
              color: Color(0xD3D3D3FF).withOpacity(_blinkAnimation.value),
            ),
          ),
          child: Center(
            child: Text(
              'Tap',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
