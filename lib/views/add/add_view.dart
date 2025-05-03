// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'dart:io';
// import 'package:permission_handler/permission_handler.dart';
//
// class RecipeImageUploader extends StatefulWidget {
//   @override
//   _RecipeImageUploaderState createState() => _RecipeImageUploaderState();
// }
//
// class _RecipeImageUploaderState extends State<RecipeImageUploader> {
//   File? _image;
//   String _caption = '';
//   int _step = 1;
//
//   // Pick image from gallery
//   Future<void> _pickImage() async {
//     // Request permissions before accessing the gallery
//     await _requestPermissions();
//
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     } else {
//       print("No image selected");
//     }
//   }
//
//   // Request permissions at runtime
//   Future<void> _requestPermissions() async {
//     PermissionStatus storageStatus = await Permission.storage.request();
//     if (storageStatus.isDenied) {
//       // Handle the case where permission is denied
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Permission to access storage is denied.')),
//       );
//     } else {
//       print("Permission granted for storage");
//     }
//   }
//
//   // Remove the selected image and go back to step 1
//   void _removeImage() async {
//     setState(() {
//       _image = null;
//       _step = 1;
//     });
//     await _pickImage();
//   }
//
//   // Implement image cropping functionality
//   Future<void> _editCrop() async {
//     if (_image != null) {
//       try {
//         final croppedFile = await ImageCropper().cropImage(
//           sourcePath: _image!.path,
//           uiSettings: [
//             AndroidUiSettings(
//               toolbarTitle: 'Crop Image',
//               toolbarColor: Colors.black,
//               toolbarWidgetColor: Colors.white,
//               initAspectRatio: CropAspectRatioPreset.original,
//               lockAspectRatio: false,
//             ),
//             IOSUiSettings(
//               title: 'Crop Image',
//               aspectRatioLockEnabled: false,
//             ),
//           ],
//         );
//
//         if (croppedFile != null) {
//           setState(() {
//             _image = File(croppedFile.path); // Update image after cropping
//           });
//           print("Image cropped successfully!");
//         } else {
//           print("Crop action cancelled or failed");
//         }
//       } catch (e) {
//         print("Error cropping image: $e");
//       }
//     } else {
//       print("No image selected for cropping");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1E1E2C),
//       appBar: AppBar(
//         title: Text('New Recipe–Step$_step'),
//         backgroundColor: Colors.black,
//         actions: [
//           if (_step == 1 && _image != null)
//             TextButton(
//               onPressed: () => setState(() => _step = 2),
//               child: const Text("Next", style: TextStyle(color: Colors.white)),
//             ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: _step == 1
//             ? Column(
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: Container(
//                 width: double.infinity,
//                 height: 300,
//                 color: Colors.grey[800],
//                 child: _image == null
//                     ? const Center(child: Icon(Icons.add_a_photo, size: 50, color: Colors.white))
//                     : Image.file(_image!, fit: BoxFit.cover),
//               ),
//             ),
//             const SizedBox(height: 10),
//             if (_image != null)
//               TextField(
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: "Add a caption...",
//                   hintStyle: const TextStyle(color: Colors.white54),
//                   filled: true,
//                   fillColor: Colors.grey[900],
//                 ),
//                 onChanged: (val) => setState(() => _caption = val),
//               ),
//           ],
//         )
//             : Column(
//           children: [
//             if (_image != null)
//               Container(
//                 width: double.infinity,
//                 height: 300,
//                 child: Image.file(_image!, fit: BoxFit.cover),
//               ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 OutlinedButton.icon(
//                   onPressed: _editCrop, // Trigger the crop functionality here
//                   icon: const Icon(Icons.crop, color: Colors.white),
//                   label: const Text("Edit Crop", style: TextStyle(color: Colors.white)),
//                   style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white)),
//                 ),
//                 const SizedBox(width: 16),
//                 OutlinedButton.icon(
//                   onPressed: _removeImage,
//                   icon: const Icon(Icons.delete, color: Colors.white),
//                   label: const Text("Remove", style: TextStyle(color: Colors.white)),
//                   style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white)),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Save functionality here
//                 print("Image saved with caption: $_caption");
//               },
//               icon: const Icon(Icons.save),
//               label: const Text("Save"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  File? _image;
  String _caption = '';
  int _step = 1;

  // Pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Remove the selected image and go back to step 1
  void _removeImage() {
    setState(() {
      _image = null;
      _step = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        title: Text('New Recipe–Step$_step'),
        backgroundColor: Colors.black,
        actions: [
          if (_step == 1 && _image != null)
            TextButton(
              onPressed: () => setState(() => _step = 2),
              child: const Text("Next", style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _step == 1
            ? Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey[800],
                child: _image == null
                    ? const Center(child: Icon(Icons.add_a_photo, size: 50, color: Colors.white))
                    : Image.file(_image!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            if (_image != null)
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Add a caption...",
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[900],
                ),
                onChanged: (val) => setState(() => _caption = val),
              ),
          ],
        )
            : Column(
          children: [
            if (_image != null)
              Container(
                width: double.infinity,
                height: 300,
                child: Image.file(_image!, fit: BoxFit.cover),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: _removeImage,
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text("Remove", style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Save functionality here
                print("Image saved with caption: $_caption");
              },
              icon: const Icon(Icons.save),
              label: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
