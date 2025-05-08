import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/utils/extension.dart';

import '../../res/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.secondary),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back<void>(),
          icon: Image.asset("assets/icons/arrow.png"),
        ),
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Zaika.AI",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            12.height,
            Text(
              "Zaika.AI is your smart culinary companion, blending the richness of tradition with the power of artificial intelligence.",
              style: TextStyle(fontSize: 14.sp, height: 1.5),
            ),
            12.height,
            Text(
              "Whether you're craving something classic or exploring new flavors, Zaika.AI helps you discover, analyze, and enhance the Zaika in every dish.",
              style: TextStyle(fontSize: 14.sp, height: 1.5),
            ),
            12.height,
            Text(
              "Need a recipe? Just ask your pocket chef! Scan your food and get your favorite Zaika recipe in seconds.",
              style: TextStyle(fontSize: 14.sp, height: 1.5),
            ),
            20.height,
            Divider(),
            12.height,
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.black,
              ),
            ),
            8.height,
            Row(
              children: [
                Icon(Icons.email, size: 18.sp, color: AppColor.secondary),
                SizedBox(width: 8.w),
                Text(
                  "help.zaika.ai@gmail.com",
                  style: TextStyle(fontSize: 14.sp),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
