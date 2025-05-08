import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/res/app_colors.dart';
import 'package:zaika_ai/utils/extension.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final uid = _auth.currentUser?.uid;

    if (uid != null) {
      try {
        final doc = await _firestore.collection('users').doc(uid).get();

        if (doc.exists) {
          final data = doc.data()!;
          nameController.text = data['name'] ?? '';
          usernameController.text = data['username'] ?? '';
          bioController.text = data['bio'] ?? '';

          print("User data loaded: $data");
        } else {
          print("Document does not exist for UID: $uid");
        }
      } catch (e) {
        print("Error loading user data: $e");
        Get.snackbar("Error", "Failed to load profile data.",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } else {
      print("User not logged in");
      Get.snackbar("Error", "User not logged in.",
          backgroundColor: Colors.red, colorText: Colors.white);
    }

    // Always stop loading spinner
    setState(() {
      isLoading = false;
    });
  }

  Future<void> saveProfile() async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) {
      Get.snackbar("Error", "User not logged in.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      await _firestore.collection('users').doc(uid).set({
        'name': nameController.text.trim(),
        'username': usernameController.text.trim(),
        'bio': bioController.text.trim(),
        'email': _auth.currentUser?.email,
      }, SetOptions(merge: true));

      // Show Snackbar using ScaffoldMessenger
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate back after short delay
        await Future.delayed(const Duration(milliseconds: 800));
        Navigator.pop(context);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update profile: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.secondary),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Image.asset("assets/icons/arrow.png"),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            20.height,
            // Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // 10.height,
            // // Username
            // TextField(
            //   controller: usernameController,
            //   decoration: InputDecoration(
            //     hintText: 'Enter your username',
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            // ),
            // 10.height,
            // // Bio
            // TextField(
            //   controller: bioController,
            //   decoration: InputDecoration(
            //     hintText: 'Tell us about yourself',
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            //   maxLines: 4,
            // ),
            const Spacer(),
            PrimaryButton(
              onTap: saveProfile,
              childWidget: Text(
                "Save",
                style: TextStyle(color: AppColor.white),
              ),
              bgColor: AppColor.black,
              gradient: false,
            ),
          ],
        ),
      ),
    );
  }
}
