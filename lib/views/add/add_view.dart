// import 'dart:io';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:zaika_ai/general_widgets/custom_field_components.dart';
// import 'package:zaika_ai/general_widgets/primary_button.dart';
//
// import '../../res/app_colors.dart';
// import 'package:zaika_ai/utils/extension.dart';
//
// class AddView extends StatefulWidget {
//   @override
//   _AddViewState createState() => _AddViewState();
// }
//
// class _AddViewState extends State<AddView> {
//   TextEditingController nameController = TextEditingController();
//   File? _selectedImage;
//   final ImagePicker _picker = ImagePicker();
//
//   void _showImageOptions() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(16.0),
//           height: 150,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(Icons.camera_alt),
//                 title: const Text('Capture Image'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _captureImage();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.photo_library),
//                 title: const Text('Choose from Gallery'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _chooseFromGallery();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> _captureImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> _chooseFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: AppColor.primary,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: AppColor.secondary),
//         centerTitle: true,
//         surfaceTintColor: Colors.transparent,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           onPressed: () => Get.back<void>(),
//           icon: Image.asset("assets/icons/arrow.png"),
//         ),
//         title: Text(
//           'Enter your recipe name or upload image',
//           style: TextStyle(
//             fontSize: 16.sp,
//             fontWeight: FontWeight.bold,
//             color: AppColor.black,
//           ),
//         ),
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: Stack(
//                 children: [
//                   // 🔹 Background image
//                   Positioned.fill(
//                     child: Image.asset(
//                       'assets/images/add_bg.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//
//                   // 🔹 Content Overlay
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       children: [
//                         20.height,
//                         CustomFieldComponents(
//                           hint: "Enter Your Recipe Name",
//                           controller: nameController,
//                         ),
//                         12.height,
//                         _selectedImage == null
//                             ? GestureDetector(
//                               onTap: _showImageOptions,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16),
//                                 child: BackdropFilter(
//                                   filter: ImageFilter.blur(
//                                     sigmaX: 10,
//                                     sigmaY: 10,
//                                   ),
//                                   child: Container(
//                                     height: 150.h,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white.withOpacity(0.1),
//                                       borderRadius: BorderRadius.circular(16),
//                                       border: Border.all(
//                                         color: Colors.white.withOpacity(0.3),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(12),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: const [
//                                           Text(
//                                             "Scan your food, unlock the Zaika",
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                           SizedBox(height: 8),
//                                           Icon(
//                                             Icons.arrow_forward,
//                                             size: 18,
//                                             color: Colors.white,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                             : Stack(
//                               children: [
//                                 Container(
//                                   height: 580.h,
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     image: DecorationImage(
//                                       image: FileImage(_selectedImage!),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 20,
//                                   left: 0,
//                                   right: 0,
//                                   child: Center(
//                                     child: ElevatedButton.icon(
//                                       onPressed: _showImageOptions,
//                                       icon: const Icon(Icons.upload_file),
//                                       label: const Text("Change Image"),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.black
//                                             .withOpacity(0.7),
//                                         foregroundColor: Colors.white,
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 24,
//                                           vertical: 12,
//                                         ),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             30,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                         20.height,
//                         PrimaryButton(
//                           onTap: () {
//                             // handle recipe generation
//                           },
//                           childWidget: const Text(
//                             'Generate Recipe',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           bgColor: AppColor.black,
//                           gradient: false,
//                         ),
//                         20.height,
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:zaika_ai/general_widgets/custom_field_components.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import '../../res/app_colors.dart';
import 'package:zaika_ai/utils/extension.dart';

import '../recipes/generated_recipe_screen.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  TextEditingController nameController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 155.h,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Image.asset(
                    "assets/icons/camera.png",
                    fit: BoxFit.contain,
                  ),
                ),
                title: const Text('Capture Image'),
                onTap: () {
                  Navigator.of(context).pop();
                  _captureImage();
                },
              ),
              ListTile(
                leading: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Image.asset(
                    "assets/icons/gallery.png",
                    fit: BoxFit.contain,
                  ),
                ),

                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _chooseFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _captureImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _chooseFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> getRecipeFromGemini({
    required String recipeName,
    File? imageFile,
  }) async {
    const apiKey = 'AIzaSyBjXUnSIoe_SzoDAu9s3wXFvb6l8Uw1vj8';

    late final Uri url;
    late final Map<String, dynamic> body;

    if (imageFile != null) {
      url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1/models/gemini-pro-vision:generateContent?key=$apiKey',
      );

      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      body = {
        "contents": [
          {
            "parts": [
              {
                "text":
                    "You are a world-class professional chef with expertise in all global cuisines. You must act like a real chef, not an AI. I have uploaded an image of a dish — please identify it and provide a highly detailed, step-by-step recipe.Always begin by warmly greeting me with: “Welcome to Zaika.AI! I’m your personal chef today.” Then describe the dish vividly — including its flavor, aroma, and traditional context if applicable. After that, give a clear, organized recipe including ingredients (with exact measurements), preparation steps, cooking time, and pro tips to enhance taste.Explain every step simply and precisely, assuming I’m cooking this for the first time. Mention tools needed, suggest alternatives for rare ingredients, and provide plating suggestions. You can give tips for storing leftovers and variations in case of dietary needs (like vegan, gluten-free).Do not say you're an AI. You are a passionate and professional chef helping me cook an amazing meal at home. Make it fun, supportive, and authentic. Never leave out small details, and don’t assume I know anything unless I ask for a simplifiedversion.",
              },
              {
                "inlineData": {"mimeType": "image/jpeg", "data": base64Image},
              },
            ],
          },
        ],
      };
    } else {
      url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=$apiKey',
      );

      body = {
        "contents": [
          {
            "parts": [
              {
                "text":
                    "You are a world-class professional chef with expertise in all global cuisines. You must act like a real chef, not an AI. I have uploaded an image of a dish — please identify it and provide a highly detailed, step-by-step recipe.Always begin by warmly greeting me with: “Welcome to Zaika.AI! I’m your personal chef today.” Then describe the dish vividly — including its flavor, aroma, and traditional context if applicable. After that, give a clear, organized recipe including ingredients (with exact measurements), preparation steps, cooking time, and pro tips to enhance taste.Explain every step simply and precisely, assuming I’m cooking this for the first time. Mention tools needed, suggest alternatives for rare ingredients, and provide plating suggestions. You can give tips for storing leftovers and variations in case of dietary needs (like vegan, gluten-free).Do not say you're an AI. You are a passionate and professional chef helping me cook an amazing meal at home. Make it fun, supportive, and authentic. Never leave out small details, and don’t assume I know anything unless I ask for a simplified version.",
              },
            ],
          },
        ],
      };
    }

    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['candidates'][0]['content']['parts'][0]['text'];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Enter your recipe name or upload image',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/add_bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        20.height,
                        CustomFieldComponents(
                          hint: "Enter Your Recipe Name",
                          controller: nameController,
                        ),
                        12.height,
                        _selectedImage == null
                            ? GestureDetector(
                              onTap: _showImageOptions,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10,
                                    sigmaY: 10,
                                  ),
                                  child: Container(
                                    height: 150.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Scan your food, unlock the Zaika",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                          ),
                                          8.height,
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 18,
                                            color: AppColor.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : Stack(
                              children: [
                                Container(
                                  height: 580.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: FileImage(_selectedImage!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: ElevatedButton.icon(
                                      onPressed: _showImageOptions,
                                      icon: const Icon(Icons.upload_file),
                                      label: const Text("Change Image"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black
                                            .withOpacity(0.7),
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        20.height,
                        PrimaryButton(
                          onTap: () async {
                            if (nameController.text.isEmpty &&
                                _selectedImage == null) {
                              Get.snackbar(
                                'Error',
                                'Please enter a recipe name or upload an image.',
                              );
                              return;
                            }

                            Get.dialog(
                              const Center(child: CircularProgressIndicator()),
                              barrierDismissible: false,
                            );

                            final result = await getRecipeFromGemini(
                              recipeName: nameController.text,
                              imageFile: _selectedImage,
                            );

                            Get.back(); // close loading dialog

                            if (result != null) {
                              Get.to(
                                () => GeneratedRecipeScreen(recipeText: result),
                              );
                            } else {
                              Get.snackbar(
                                'Error',
                                'Failed to generate recipe. Please try again.',
                              );
                            }
                          },

                          childWidget: const Text(
                            'Generate Recipe',
                            style: TextStyle(color: AppColor.white),
                          ),
                          bgColor: AppColor.black,
                          gradient: false,
                        ),
                        20.height,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
