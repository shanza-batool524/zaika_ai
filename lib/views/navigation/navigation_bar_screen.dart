import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../dashboard/dashboard_screen.dart'; // Import your dashboard screen

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  // Show the bottom sheet with "Capture Image" and "Choose from Gallery"
  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      // barrierDismissible: true, // Allow dismissing by tapping outside the bottom sheet
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: const Text('Capture Image'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                  _captureImage(); // Open camera to capture image
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                  _chooseFromGallery(); // Open gallery to choose image
                },
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      // After the bottom sheet is dismissed, return to Dashboard screen (index 0)
      setState(() {
        _selectedIndex = 0;
      });
    });
  }

  // Capture image using the camera
  Future<void> _captureImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print("No image captured");
    }
  }

  // Choose image from the gallery
  Future<void> _chooseFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print("No image selected");
    }
  }

  // List of screens
  final List<Widget> _screens = [
    DashboardScreen(), 
    DashboardScreen(),
    DashboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,

        color: Colors.blue,
        buttonBackgroundColor: Colors.orange,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index: _selectedIndex,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.add, color: Colors.white),
            label: 'Add',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;

            // When the "Add" button is clicked, show the bottom sheet
            if (_selectedIndex == 1) {
              _showImageOptions(); // Show the bottom sheet
            }
          });
        },
      ),
    );
  }
}
