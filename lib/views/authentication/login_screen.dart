import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/general_widgets/custom_field_components.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/authentication/signup_screen.dart'; // Navigate to SignupScreen
import 'package:zaika_ai/views/dashboard/dashboard_screen.dart'; // Navigate to DashboardScreen

import '../../general_widgets/notch_clipper.dart';
import '../../res/app_colors.dart';
import '../../res/image_urls.dart';
import '../../view_models/auth_viewmodel/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Reference to AuthViewModel (GetX Controller)
  //final AuthViewModel _authViewModel = Get.put(AuthViewModel());
  final AuthViewModel _authViewModel = Get.find<AuthViewModel>();

  // Handle user sign in
  Future<void> _signIn() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError("Email and password are required.");
      return;
    }

    // Call your sign-in method here
    await _authViewModel.signIn(email, password);

    if (_authViewModel.user != null) {
      // If the user is successfully logged in, navigate to DashboardScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()), // Navigate to Dashboard
      );
    } else {
      // If there is any issue, show an error message in Snackbar
      _showError(_authViewModel.errorMessage.isEmpty ? "Failed to sign in" : _authViewModel.errorMessage);
    }
  }

  // Display error messages in Snackbar
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

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
                          "Login",
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
                          hint: "Password",
                          controller: passwordController,
                          obscureText: true,  // Password field
                        ),
                        16.height,
                        // Use Obx or GetX to observe loading state
                        Obx(() {
                          return PrimaryButton(
                            onTap: _signIn, // Handle the sign-in functionality
                            childWidget: Text(
                              _authViewModel.isLoading
                                  ? "Signing In..."
                                  : "Sign In",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 20,
                              ),
                            ),
                            bgColor: AppColor.black,
                            gradient: false,
                          );
                        }),
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
                              "Don't have an account? ",
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
                                    builder: (context) => const SignupScreen(),
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
