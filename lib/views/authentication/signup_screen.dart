import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaika_ai/general_widgets/custom_field_components.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/authentication/login_screen.dart';

import '../../general_widgets/notch_clipper.dart';
import '../../res/app_colors.dart';
import '../../res/image_urls.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              'assets/images/signup.png',
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
                        Text(
                          "SignUp",
                          style: TextStyle(
                            color: AppColor.brown,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        16.height,
                        CustomFieldComponents(
                          hint: "Email",
                          controller: emailController,
                        ),
                        8.height,
                        CustomFieldComponents(
                          hint: "Create a Password",
                          controller: emailController,
                        ),
                        8.height,
                        CustomFieldComponents(
                          hint: "Reset Password",
                          controller: emailController,
                        ),
                        16.height,
                        PrimaryButton(
                          onTap: () {
                            // Get.toNamed(RouteName.proSubscriptionScreen);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
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
                        20.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            socialIcon(ImagesUrls.facebook),
                            SizedBox(width: 24.w),
                            socialIcon(ImagesUrls.google),
                            SizedBox(width: 24.w),
                            socialIcon(ImagesUrls.apple),
                          ],
                        ),
                        20.height,
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
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


Widget socialIcon(String assetPath) {
  return Container(
    width: 48.w,
    height: 48.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColor.sec_text),
    ),
    child: Center(child: Image.asset(assetPath, width: 24.w, height: 24.h)),
  );
}
