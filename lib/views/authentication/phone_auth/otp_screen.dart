import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/dashboard/dashboard_screen.dart';

import '../../../general_widgets/notch_clipper.dart';
import '../../../res/app_colors.dart';
import 'package:pinput/pinput.dart';

import '../../../routers/router_names.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() =>
      _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(backgroundColor: Colors.grey[100], body: Container()),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/otp.png',
              fit: BoxFit.fill,
              height: 380,
            ),
          ),

          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: NotchedClipper(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 800, // adjust height
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        130.height,
                        Image.asset("assets/logo/logo.JPG", height: 60),
                        10.height,
                        RichText(
                          text: TextSpan(
                            text: 'Enter the code to',
                            style: TextStyle(
                              color: AppColor.brown,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: '\nVerify your phone',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.height,
                        Text(
                          "We have send you an sms to number", style: TextStyle(
                          fontSize: 20.sp,
                        ),),
                        Center(
                          child: Text(
                            "+84432047",
                            style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        16.height,
                        Center(
                          child: Pinput(
                            controller: _otpController,
                            length: 4,
                            defaultPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(
                                    28), // Make it HALF of width/height
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(
                                    28), // Same for focused field
                              ),
                            ),
                            showCursor: false,
                          ),
                        ),
                         20.height,
                        PrimaryButton(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardScreen()));
                          },
                          childWidget: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 20,
                            ),
                          ),
                          bgColor: AppColor.black,
                          gradient: false,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn’t receive the code? ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.black,
                                ),
                              ),
                              Text(
                                "Resend",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


