import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:get/get.dart';


import '../../res/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          onPressed: () {
            Get.back<void>();
          },
          icon: Image.asset("assets/icons/arrow.png"),
        ),

        title: Text(
          'Edit Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/signup.png'), // Change the image path accordingly
              ),
            ),

            20.height,
            // Name Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
10.height,            // Username Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your username',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            10.height,            // Username Field
            // Bio Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Tell us about yourself',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              maxLines: 4,
            ),
            Spacer(),
            // Save Button
           PrimaryButton(onTap: (){}, childWidget: Text("Save",style: TextStyle(color: AppColor.white),), bgColor: AppColor.black, gradient: false)
          ],
        ),
      ),
    );
  }
}