import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zaika_ai/res/app_colors.dart';
import 'package:zaika_ai/test.dart';
import 'package:zaika_ai/views/authentication/login_screen.dart';
import 'package:zaika_ai/views/authentication/phone_auth/otp_screen.dart';
import 'package:zaika_ai/views/authentication/phone_auth/phone_authentication_screen.dart';
import 'package:zaika_ai/views/authentication/signup_screen.dart';
import 'package:zaika_ai/views/dashboard/dashboard_screen.dart';
import 'package:zaika_ai/views/navigation/navigation_bar_screen.dart';
import 'package:zaika_ai/views/onboarding/onboarding_screen_one.dart';
import 'package:zaika_ai/views/onboarding/onboarding_screen_three.dart';
import 'package:zaika_ai/views/onboarding/onboarding_screen_two.dart';
import 'package:zaika_ai/views/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          theme: ThemeData(
            iconTheme: const IconThemeData(color: AppColor.secondary),
            primaryColor: AppColor.primary,
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: AppColor.primary,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: AppColor.primary,
                statusBarColor: AppColor.primary, // status bar color
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Zaika AI',
          // getPages: AppRoutes.appRoute(),
          // initialRoute: RouteName.notificationScreen,
          // initialRoute: RouteName.splashScreen,
          home: NavigationScreen(),
        );
      },
    );
  }
}
