// import 'package:flutter/material.dart';
// import 'package:zaika_ai/views/onboarding/onboarding_screen_one.dart';
//
// import '../../res/app_colors.dart';
//
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     );
//
//     _controller.forward();
//
//     Future.delayed(const Duration(milliseconds: 3500), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const OnboardingScreenOne()),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.splash,
//       body: Center(
//         child: ScaleTransition(
//           scale: _animation,
//           child: Image.asset(
//             'assets/logo/splash_logo.png',
//             height: 190,
//             width: 190,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/views/onboarding/onboarding_screen_one.dart';
import 'package:zaika_ai/views/dashboard/dashboard_screen.dart';  // Import Dashboard Screen

import '../../res/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();

    // Check the authentication status after the animation finishes
    Future.delayed(const Duration(milliseconds: 3500), () {
      _checkUserAuthentication();
    });
  }

  // Check if the user is logged in
  void _checkUserAuthentication() async {
    User? user = FirebaseAuth.instance.currentUser;

    // Navigate to the appropriate screen based on the user's authentication status
    if (user != null) {
      // User is logged in, navigate to the Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      // User is not logged in, navigate to the Onboarding screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreenOne()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.splash,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            'assets/logo/splash_logo.png',
            height: 190,
            width: 190,
          ),
        ),
      ),
    );
  }
}
