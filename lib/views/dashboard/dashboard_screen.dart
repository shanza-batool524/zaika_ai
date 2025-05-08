import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaika_ai/routers/router_names.dart';
import 'package:zaika_ai/utils/extension.dart';
import '../../res/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<RecipeItem> recipes = [
    RecipeItem(
      imagePath: 'assets/images/recipe_1.png',
      caption: 'chocolate icecream \nbuttercream fruit',
      rating: 4.8,
    ),
    RecipeItem(
      imagePath: 'assets/images/recipe_2.png',
      caption: 'Italian pineapple\n pizza',
      rating: 4.6,
    ),
    RecipeItem(
      imagePath: 'assets/images/recipe_3.png',
      caption: 'chocolate cake with\n buttercream frosting',
      rating: 4.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/chef.jpg',

              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  280.height,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Hello Buddy!!",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  20.height,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
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
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.addView);
                            },
                            borderRadius: BorderRadius.circular(16.r),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "GET YOUR AI POWERED RECIPE NOW",
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
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        RecipeCard(
                          title: "Explore Nutritions",
                          imagePath: 'assets/icons/nutrition.png',
                        ),
                        RecipeCard(
                          title: 'Workouts',
                          imagePath: 'assets/icons/workout.png',
                        ),
                      ],
                    ),
                  ),
                  20.height,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Popular Recipes",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  10.height,
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final item = recipes[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 150.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    item.imagePath,
                                    fit: BoxFit.cover,
                                    height: 260.h,
                                    width: 150.w,
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star_border,
                                            color: AppColor.white,
                                            size: 16,
                                          ),
                                          4.width,
                                          Text(
                                            item.rating.toString(),
                                            style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black87,
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        item.caption,
                                        style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  20.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const RecipeCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            // or try 0.5 for more solid look
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16.r),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    height: 40.h,
                    width: 40.w,
                    fit: BoxFit.contain,
                  ),
                  12.height,
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                  8.height,
                  const Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeItem {
  final String imagePath;
  final String caption;
  final double rating;

  RecipeItem({
    required this.imagePath,
    required this.caption,
    required this.rating,
  });
}
