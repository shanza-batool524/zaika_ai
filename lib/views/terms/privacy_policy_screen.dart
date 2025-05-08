import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/utils/extension.dart';

import '../../res/app_colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          'Privacy Policy',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              "Your privacy is our priority. We are committed to safeguarding your personal information and ensuring transparency in how your data is collected, used, and protected.",
              style: TextStyle(fontSize: 14.sp, height: 1.6),
            ),
            20.height,

            _sectionTitle("1. Data Collection"),
            _sectionText(
              "We collect only the data necessary to provide and improve our services. This may include name, email, food preferences, and user interaction data. No sensitive data is collected without your explicit consent.",
            ),

            _sectionTitle("2. Data Usage"),
            _sectionText(
              "Your data is used solely to personalize your experience, improve functionality, and offer AI-powered recommendations. We do not sell, rent, or share your data with third parties without permission.",
            ),

            _sectionTitle("3. User Consent"),
            _sectionText(
              "By using the app, you agree to our privacy policy. You may withdraw consent or delete your data anytime through your account settings.",
            ),

            _sectionTitle("4. Data Security"),
            _sectionText(
              "We use industry-standard encryption and security measures to protect your data from unauthorized access or misuse.",
            ),

            _sectionTitle("5. Third-Party Services"),
            _sectionText(
              "We may use third-party services like analytics or cloud storage. These services are vetted for compliance with global data protection laws such as GDPR and CCPA.",
            ),

            _sectionTitle("6. Data Retention"),
            _sectionText(
              "We retain your data only as long as necessary for its purpose or as required by law.",
            ),

            _sectionTitle("7. Children’s Privacy"),
            _sectionText(
              "Our services are not intended for children under 13. We do not knowingly collect data from children without parental consent.",
            ),

            20.height,
            Divider(),
            Text(
              "If you have questions or concerns, feel free to contact us at:",
              style: TextStyle(fontSize: 14.sp),
            ),
            8.height,
            Row(
              children: [
                Icon(Icons.email, size: 18.sp, color: AppColor.secondary),
               8.width,
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

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 4.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
      ),
    );
  }

  Widget _sectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14.sp, height: 1.5),
    );
  }
}
