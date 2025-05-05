import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<String?> pickAndConvertImageToBase64() async {
  final picker = ImagePicker();
  final image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    final bytes = await File(image.path).readAsBytes();
    return base64Encode(bytes);
  }
  return null;
}
