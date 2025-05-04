import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zaika_ai/res/app_colors.dart';
import 'package:zaika_ai/view_models/auth_viewmodel/auth_view_model.dart';
import 'package:zaika_ai/view_models/controllers/auth_controller.dart';
import 'package:zaika_ai/views/add/add_view.dart';
import 'package:zaika_ai/views/authentication/login_screen.dart';
import 'package:zaika_ai/views/authentication/signup_screen.dart';
import 'package:zaika_ai/views/navigation/navigation_bar_screen.dart';
import 'package:zaika_ai/views/profile/profile_screen.dart';
import 'package:zaika_ai/views/recipes/recipe_ingredients_screen.dart';
import 'package:zaika_ai/views/splash/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Ensure you use the generated Firebase options
  );
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
    Get.put(AuthViewModel(), permanent: true);
    Get.put(AuthController(), permanent: true);
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
          home:SignupScreen(),
        );
      },
    );
  }
}
