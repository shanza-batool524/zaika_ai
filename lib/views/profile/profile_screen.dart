import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  String username = '';
  String bio = '';
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
        final doc = await _firestore.collection('users').doc(uid).get();
        if (doc.exists) {
          final data = doc.data()!;
          setState(() {
            name = data['name'] ?? '';
            username = data['username'] ?? '';
            bio = data['bio'] ?? '';
            email = userEmail ?? '';
            isLoading = false;
          });
        }
      } catch (e) {
        print("Error loading profile: $e");
        setState(() => isLoading = false);
      }
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
                  backgroundImage:
                  AssetImage("assets/images/chef.jpg"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(email, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 5),
              if (username.isNotEmpty)
                Text("@$username", style: const TextStyle(color: Colors.grey)),
              if (bio.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8),
                  child: Text(bio,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black87)),
                ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.black),
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                  // Refresh data after returning
                  await loadUserData();
                },
              ),
              SwitchListTile(
                value: true,
                onChanged: (bool value) {},
                title: const Text("Mode"),
                secondary:
                const Icon(Icons.lightbulb_outline, color: Colors.black),
              ),
              ListTile(
                leading: const Icon(Icons.save_alt_outlined,
                    color: Colors.black),
                title: const Text('Saved'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {},
              ),
              ListTile(
                leading:
                const Icon(Icons.lock_outline, color: Colors.black),
                title: const Text('Privacy & Conditions'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.black),
                title: const Text('About'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.star_border, color: Colors.black),
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
