import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String?> getRecipeFromGemini({
  required String recipeName,
  File? imageFile, // now optional
}) async {
  const apiKey = 'AIzaSyBjXUnSIoe_SzoDAu9s3wXFvb6l8Uw1vj8';

  late final Uri url;
  late final Map<String, dynamic> body;

  if (imageFile != null) {
    // Use gemini-pro-vision for image + text
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
              "inlineData": {
                "mimeType": "image/jpeg",
                "data": base64Image,
              }
            }
          ]
        }
      ]
    };
  } else {
    // Use gemini-2.0-flash for text only
    url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=$apiKey',
    );

    body = {
      "contents": [
        {
          "parts": [
            {
              "text":
              "You're an expert chef. Given the recipe name '$recipeName', generate a detailed recipe with ingredients, preparation steps, and cooking instructions."
            },
          ]
        }
      ]
    };
  }

  final headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.post(url, headers: headers, body: jsonEncode(body));
  print("response is ${response.body}");

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return json['candidates'][0]['content']['parts'][0]['text'];
  } else {
    print("API Error: ${response.body}");
    return null;
  }
}
