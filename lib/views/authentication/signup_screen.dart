// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:zaika_ai/general_widgets/custom_field_components.dart';
// import 'package:zaika_ai/general_widgets/primary_button.dart';
// import 'package:zaika_ai/utils/extension.dart';
// import 'package:zaika_ai/views/authentication/login_screen.dart';
// import 'package:zaika_ai/views/dashboard/dashboard_screen.dart';
// import '../../general_widgets/notch_clipper.dart';
// import '../../view_models/auth_viewmodel/auth_view_model.dart';
// import '../../res/app_colors.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   final AuthViewModel _viewModel = Get.put(AuthViewModel());
//
//   Future<void> _signUp() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     String confirmPassword = confirmPasswordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
//       _showError("All fields are required.");
//       return;
//     }
//
//     if (password != confirmPassword) {
//       _showError("Passwords do not match.");
//       return;
//     }
//
//     await _viewModel.signUp(email, password);
//
//     if (_viewModel.user != null) {
//       Get.offAll(() => const DashboardScreen());
//     } else {
//       _showError(
//         _viewModel.errorMessage.isEmpty
//             ? "Failed to sign up"
//             : _viewModel.errorMessage.value,
//       );
//     }
//   }
//
//   Future<void> _googleSignUp() async {
//     await _viewModel.signInWithGoogle();
//
//     if (_viewModel.user != null) {
//       Get.offAll(() => const DashboardScreen());
//     } else {
//       _showError(_viewModel.errorMessage.value);
//     }
//   }
//
//   void _showError(String message) {
//     Get.snackbar(
//       "Sign Up Failed",
//       message,
//       backgroundColor:  AppColor.white,
//       colorText: AppColor.white,
//       snackPosition: SnackPosition.BOTTOM,
//       margin: const EdgeInsets.all(10),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'assets/images/signup.png',
//               fit: BoxFit.fill,
//               height: 380.h,
//             ),
//           ),
//           Positioned(
//             top: 180,
//             left: 0,
//             right: 0,
//             child: ClipPath(
//               clipper: NotchedClipper(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                     ),
//                   ),
//                   height: 800,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         130.height,
//                         Image.asset("assets/logo/logo.JPG", height: 60),
//                         10.height,
//                         Text(
//                           "SignUp",
//                           style: TextStyle(
//                             color: AppColor.brown,
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         16.height,
//                         CustomFieldComponents(
//                           hint: "Email",
//                           controller: emailController,
//                         ),
//                         8.height,
//                         CustomFieldComponents(
//                           hint: "Create a Password",
//                           controller: passwordController,
//                           obscureText: true,
//                         ),
//                         8.height,
//                         CustomFieldComponents(
//                           hint: "Confirm Password",
//                           controller: confirmPasswordController,
//                           obscureText: true,
//                         ),
//                         16.height,
//                         PrimaryButton(
//                           onTap: _signUp,
//                           childWidget: Text(
//                             "Sign Up",
//                             style: TextStyle(
//                               color: AppColor.white,
//                               fontSize: 20,
//                             ),
//                           ),
//                           bgColor: AppColor.black,
//                           gradient: false,
//                         ),
//                         20.height,
//                         Row(
//                           children: [
//                             Expanded(child: Divider(color: AppColor.grey, thickness: 1)),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8),
//                               child: Text("Or", style: TextStyle(fontSize: 14.sp, color: AppColor.black)),
//                             ),
//                             Expanded(child: Divider(color: AppColor.grey, thickness: 1)),
//                           ],
//                         ),
//                         20.height,
//                         PrimaryButton(
//                           onTap: _googleSignUp,
//                           childWidget: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset("assets/icons/google.png", height: 20),
//                               10.width,
//                               Text("Continue with Google", style: TextStyle(color: AppColor.white)),
//                             ],
//                           ),
//                           bgColor: AppColor.black,
//                           gradient: false,
//                         ),
//                         20.height,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Already have an account? ",
//                               style: TextStyle(fontSize: 14.sp, color: AppColor.text),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Get.to(() => const LoginScreen());
//                               },
//                               child: Text(
//                                 "Login",
//                                 style: TextStyle(
//                                   fontSize: 14.sp,
//                                   color: AppColor.orange,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/general_widgets/custom_field_components.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/authentication/login_screen.dart';
import 'package:zaika_ai/views/dashboard/dashboard_screen.dart';
import 'package:zaika_ai/views/navigation/navigation_bar_screen.dart';
import '../../general_widgets/notch_clipper.dart';
import '../../view_models/auth_viewmodel/auth_view_model.dart';
import '../../res/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final AuthViewModel _viewModel = Get.put(AuthViewModel());

  bool _isLoading = false; // Track the loading state

  Future<void> _signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String username = usernameController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || username.isEmpty) {
      _showError("All fields are required.");
      return;
    }

    if (password != confirmPassword) {
      _showError("Passwords do not match.");
      return;
    }

    setState(() {
      _isLoading = true; // Show the loading indicator
    });

    await _viewModel.signUp(email, password, username);

    setState(() {
      _isLoading = false; // Hide the loading indicator after the operation
    });

    if (_viewModel.user != null) {
      Get.snackbar(
        "Sign Up Successful",
        "Welcome to the app!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );

      // Smooth transition to the Dashboard screen
      Get.offAll(() => const NavigationScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
    } else {
      _showError(
        _viewModel.errorMessage.value.isEmpty
            ? "Failed to sign up."
            : _viewModel.errorMessage.value,
      );
    }
  }

  Future<void> _googleSignUp() async {
    await _viewModel.signInWithGoogle();

    if (_viewModel.user != null) {
      Get.snackbar(
        "Sign Up Successful",
        "Welcome to the app!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );

      // Smooth transition to the Dashboard screen
      Get.offAll(() => const NavigationScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
    } else {
      _showError(
        _viewModel.errorMessage.value.isEmpty
            ? "Google sign-in failed."
            : _viewModel.errorMessage.value,
      );
    }
  }

  void _showError(String message) {
    Get.snackbar(
      "Sign Up Failed",
      message,
      backgroundColor: AppColor.white,
      colorText: Colors.red,
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
              fit: BoxFit.contain,
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 800,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          100.height,
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
                            hint: "Username",
                            controller: usernameController,
                          ),
                          8.height,
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
                            childWidget: _isLoading
                                ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : Text(
                              "Sign Up",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 20,
                              ),
                            ),
                            bgColor: AppColor.black,
                            gradient: false,
                          ),
                          10.height,
                          Row(
                            children: [
                              Expanded(child: Divider(color: AppColor.grey, thickness: 1)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text("Or", style: TextStyle(fontSize: 14.sp, color: AppColor.black)),
                              ),
                              Expanded(child: Divider(color: AppColor.grey, thickness: 1)),
                            ],
                          ),
                          10.height,
                          PrimaryButton(
                            onTap: _googleSignUp,
                            childWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/google.png", height: 20),
                                10.width,
                                Text("Continue with Google", style: TextStyle(color: AppColor.white)),
                              ],
                            ),
                            bgColor: AppColor.black,
                            gradient: false,
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(fontSize: 14.sp, color: AppColor.text),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const LoginScreen());
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
          ),
        ],
      ),
    );
  }
}
