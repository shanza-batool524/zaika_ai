import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/general_widgets/custom_field_components.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/authentication/signup_screen.dart';
import 'package:zaika_ai/views/dashboard/dashboard_screen.dart';
import 'package:zaika_ai/views/navigation/navigation_bar_screen.dart';
import '../../general_widgets/notch_clipper.dart';
import '../../view_models/auth_viewmodel/auth_view_model.dart';
import '../../res/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

  Future<void> _signIn() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError("Email and password are required.");
      return;
    }

    await _authViewModel.signIn(email, password);

    if (_authViewModel.user != null) {
      Get.offAll(() => const NavigationScreen());
    } else {
      _showError(
        _authViewModel.errorMessage.isEmpty
            ? "Failed to sign in"
            : _authViewModel.errorMessage.value,
      );
    }
  }

  Future<void> _googleSignIn() async {
    await _authViewModel.signInWithGoogle();

    if (_authViewModel.user != null) {
      Get.offAll(() => const DashboardScreen());
    } else {
      _showError(_authViewModel.errorMessage.value);
    }
  }

  void _showError(String message) {
    Get.snackbar(
      "Login Failed",
      message,
      backgroundColor: AppColor.white,
      colorText: AppColor.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/signup.png',
              fit: BoxFit.fill,
              height: 380.h,
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
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  height: 800.h,
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
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        16.height,
                        CustomFieldComponents(
                          hint: "Email",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        8.height,
                        CustomFieldComponents(
                          hint: "Password",
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        16.height,
                        PrimaryButton(
                          onTap: _signIn,
                          childWidget: Text(
                            "Login",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          bgColor: AppColor.black,
                          gradient: false,
                        ),
                        16.height,
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
                          onTap: _googleSignIn,
                          childWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/google.png",
                                height: 20.h,
                              ),
                              10.width,
                              Text(
                                "Sign in with Google",
                                style: TextStyle(color: AppColor.white),
                              ),
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
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.text,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const SignupScreen());
                              },
                              child: Text(
                                "SignUp",
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
