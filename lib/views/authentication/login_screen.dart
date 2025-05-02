import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaika_ai/general_widgets/custom_field_components.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/authentication/phone_auth/phone_authentication_screen.dart';

import '../../general_widgets/notch_clipper.dart';
import '../../res/app_colors.dart';
import '../../routers/router_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Scaffold(backgroundColor: Colors.grey[100], body: Container()),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/food.png',
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
                            text: 'Welcome to ',
                            style: TextStyle(
                              color: AppColor.brown,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: '\nZaika.Ai',
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
                        CustomFieldComponents(
                          hint: "Email",
                          controller: emailController,
                        ),
                        8.height,
                        CustomFieldComponents(
                          hint: "Password",
                          controller: emailController,
                        ),
                        8.height,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget your Password?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        8.height,
                        PrimaryButton(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneAuthenticationScreen()));
                          },
                          childWidget: Text(
                            "Sign In",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 20,
                            ),
                          ),
                          bgColor: AppColor.black,
                          gradient: false,
                        ),
                        20.height,
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColor.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColor.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColor.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an account yet? ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.text,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColor.orange, // purple color
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
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


