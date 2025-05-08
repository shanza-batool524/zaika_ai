import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/res/app_colors.dart';
import 'package:zaika_ai/routers/router_names.dart';
import 'package:zaika_ai/routers/routers.dart';
import 'package:zaika_ai/view_models/controllers/auth_controller.dart';
import 'package:zaika_ai/view_models/auth_viewmodel/auth_view_model.dart';
import 'package:zaika_ai/views/add/add_view.dart';
import 'package:zaika_ai/views/authentication/signup_screen.dart';
import 'package:zaika_ai/views/authentication/login_screen.dart';
import 'package:zaika_ai/views/dashboard/dashboard_screen.dart';
import 'package:zaika_ai/views/navigation/navigation_bar_screen.dart';
import 'package:zaika_ai/views/onboarding/onboarding_screen_one.dart';
import 'package:zaika_ai/views/profile/edit_profile_screen.dart';
import 'package:zaika_ai/views/profile/profile_screen.dart';
import 'package:zaika_ai/views/recipes/generated_recipe_screen.dart';
import 'package:zaika_ai/views/terms/about_screen.dart';
import 'package:zaika_ai/views/terms/privacy_policy_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthController(), permanent: true);
  Get.put(AuthViewModel(), permanent: true);

  await SystemChrome.setPreferredOrientations([
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
          debugShowCheckedModeBanner: false,
          title: 'Zaika AI',
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: AppColor.primary,
            scaffoldBackgroundColor: AppColor.primary,
            iconTheme: const IconThemeData(color: AppColor.secondary),
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColor.primary,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: AppColor.primary,
              ),
            ),
          ),
          // TODO: Add routing once ready
          getPages: AppRoutes.appRoute(),
          initialRoute: RouteName.splashScreen,
          // home: ProfileScreen(),
        );
      },
    );
  }
}
