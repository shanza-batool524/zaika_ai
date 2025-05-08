import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/onboarding/onboarding_screen_three.dart';
import '../../general_widgets/onboarding_widget.dart';
import '../../res/app_colors.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({super.key});

  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600), // slower animation
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _animation1 = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeOut));

    _animation2 = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeOut));

    _animation3 = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller3, curve: Curves.easeOut));

    // Start animations with slight delays
    _controller1.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller2.forward();
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      _controller3.forward();
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xffFF6339),
        backgroundColor: const Color(0xffFA812F),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.height,
                SlideTransition(
                  position: _animation1,
                  child: Image.asset(
                    "assets/onboarding/4.png",
                    height: 180.h,
                  ),
                ),
                20.height,
                SlideTransition(
                  position: _animation2,
                  child: Image.asset(
                    "assets/onboarding/5.png",
                    height: 180.h,
                  ),
                ),
                20.height,
                SlideTransition(
                  position: _animation3,
                  child: Image.asset(
                    "assets/onboarding/6.png",
                    height: 180.h,
                  ),
                ),
                20.height,
               Text("Your personal guide to be a chef",style: TextStyle(color:AppColor.white,fontSize: 35.sp,fontWeight: FontWeight.w700),),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingScreenThree()));
                    },
                    child: Image.asset(
                      "assets/images/button.png",
                      // width: double.infinity,
                      height: 70.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
