import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zaika_ai/general_widgets/custom_field_components.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/authentication/login_screen.dart';
import '../../general_widgets/notch_clipper.dart';
import '../../res/app_colors.dart';
import 'package:get/get.dart';

import '../../view_models/auth_viewmodel/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Initialize AuthViewModel
  final AuthViewModel viewModel = Get.find<AuthViewModel>();

  Future<void> _signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showError("All fields are required.");
      return;
    }

    if (password != confirmPassword) {
      _showError("Passwords do not match.");
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } catch (e) {
      _showError(e.toString());
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  height: 800,
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
                          controller: passwordController,
                          obscureText: true,
                        ),
                        8.height,
                        CustomFieldComponents(
                          hint: "Confirm Password",
                          controller: confirmPasswordController,
                          obscureText: true,
                        ),
                        16.height,
                        PrimaryButton(
                          onTap: _signUp,
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
                        PrimaryButton(
                          onTap: () async {
                            // Trigger Google Sign-In
                            await viewModel.signInWithGoogle();
                            if (viewModel.user != null) {
                              // Successfully signed in with Google
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            } else {
                              // Show error message if sign-in failed
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(viewModel.errorMessage)),
                              );
                            }
                          },
                          childWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/google.png"),
                              10.width,
                              Text("Continue with Google", style: TextStyle(color: AppColor.white)),
                            ],
                          ),
                          bgColor: AppColor.black,
                          gradient: false,
                        ),
                        20.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
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
                                "Login",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColor.orange,
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
