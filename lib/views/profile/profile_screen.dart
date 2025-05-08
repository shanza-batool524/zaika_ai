import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaika_ai/routers/router_names.dart';
import 'package:zaika_ai/utils/extension.dart';
import '../../res/app_colors.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String name = '';
  String email = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final uid = _auth.currentUser?.uid;
    final userEmail = _auth.currentUser?.email;

    if (uid != null) {
      try {
        final docRef = _firestore.collection('users').doc(uid);
        final doc = await docRef.get();

        if (doc.exists) {
          final data = doc.data()!;
          setState(() {
            name = data['username'] ?? '';
            email = userEmail ?? '';
            isLoading = false;
          });
        } else {
          await docRef.set({'username': '', 'email': userEmail ?? ''});

          setState(() {
            name = '';
            email = userEmail ?? '';
            isLoading = false;
          });
        }
      } catch (e) {
        print("Error loading profile: $e");
        setState(() => isLoading = false);
      }
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
          'Profile',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: loadUserData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage(
                    "assets/images/avatar.jpg",
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
              10.height,
              Text(
                name.isNotEmpty ? name : 'No Name',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(email, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.black),
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );

                  if (result == true) {
                    await loadUserData(); // Refresh data after profile update
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile updated successfully'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  }
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                ),
                title: const Text('Privacy & Conditions'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Get.toNamed(RouteName.privacyPolicyScreen);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
                title: const Text('About'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Get.toNamed(RouteName.aboutScreen);

                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.star_border,
                  color: Colors.black,
                ),
                title: const Text('Rate This App'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.share, color: Colors.black),
                title: const Text('Share This App'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Log out'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Logout"),
                        content: const Text(
                          "Are you sure you want to logout?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pop(); // Close dialog
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(
                                context,
                              ).pop(); // Close dialog
                              await FirebaseAuth.instance
                                  .signOut(); // Sign out
                              Get.toNamed(RouteName.loginScreen);
                            },
                            child: const Text(
                              "Logout",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
