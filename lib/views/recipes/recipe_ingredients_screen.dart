import 'package:flutter/material.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';

import '../../res/app_colors.dart';

class RecipeIngredientsScreen extends StatefulWidget {
  const RecipeIngredientsScreen({super.key});

  @override
  State<RecipeIngredientsScreen> createState() =>
      _RecipeIngredientsScreenState();
}

class _RecipeIngredientsScreenState extends State<RecipeIngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top
            Image.asset('assets/images/signup.png'),
            // Make sure to put the image in your assets

            // Recipe title and additional info
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perfect Homemade Pancake',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Low Calorie | Simple | 40 Min',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Step-by-step instructions
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8 Steps',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  RecipeStep(
                    stepNumber: '01',
                    stepDescription:
                        'In a large bowl, mix together flour, baking powder, sugar, and salt.',
                  ),
                  RecipeStep(
                    stepNumber: '02',
                    stepDescription:
                        'In a separate bowl, whisk together milk, eggs, and oil or melted butter. Add vanilla extract if desired.',
                  ),
                  RecipeStep(
                    stepNumber: '03',
                    stepDescription:
                        'Gradually add the liquid mixture to the dry ingredients, stirring until a smooth, lumpy batter forms.',
                  ),
                  RecipeStep(
                    stepNumber: '04',
                    stepDescription:
                        'Heat a griddle or skillet over medium heat. Brush lightly with butter or oil, then pour the batter onto the griddle to form pancakes.',
                  ),
                  RecipeStep(
                    stepNumber: '05',
                    stepDescription:
                        'Cook until bubbles form on the surface of the pancake, then flip and cook the other side until golden brown.',
                  ),
                  RecipeStep(
                    stepNumber: '06',
                    stepDescription:
                        'Repeat the process with the remaining batter.',
                  ),
                  RecipeStep(
                    stepNumber: '07',
                    stepDescription:
                        'Serve the pancakes warm with your favorite toppings such as maple syrup, honey, fresh fruit, or chocolate chips.',
                  ),
                  RecipeStep(
                    stepNumber: '08',
                    stepDescription: 'Enjoy your delicious homemade pancakes!',
                  ),
                  30.height,
                  PrimaryButton(
                    onTap: () {},
                    childWidget: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    bgColor: AppColor.black,
                    gradient: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeStep extends StatelessWidget {
  final String stepNumber;
  final String stepDescription;

  RecipeStep({required this.stepNumber, required this.stepDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.orange,
            child: Text(
              stepNumber,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(stepDescription, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
