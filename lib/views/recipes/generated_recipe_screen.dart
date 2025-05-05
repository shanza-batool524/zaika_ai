import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../res/app_colors.dart';

class GeneratedRecipeScreen extends StatelessWidget {
  final String recipeText;

  const GeneratedRecipeScreen({Key? key, required this.recipeText}) : super(key: key);

  String cleanRecipeText(String text) {
    return text.replaceAllMapped(RegExp(r'\*\*(.*?)\*\*'), (match) {
      return match.group(1) ?? '';
    });
  }

  Future<void> generateAndSavePDF(String content) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Text(content),
      ),
    );

    try {
      final outputDir = await getApplicationDocumentsDirectory();
      final filePath = '${outputDir.path}/ZaikaAI_Recipe.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      Get.snackbar('Success', 'Recipe PDF saved at: $filePath',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Failed to save PDF: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    String cleanedRecipe = cleanRecipeText(recipeText);

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text('Your Recipe', style: TextStyle(color: AppColor.black)),
        backgroundColor: AppColor.primary,
        iconTheme: IconThemeData(color: AppColor.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () => generateAndSavePDF(cleanedRecipe),
              icon: Icon(Icons.download, size: 18),
              label: Text('PDF', style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Text(
            cleanedRecipe,
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
