import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../colour/colors.dart';

/// Category Model
class CategoryData {
  final String name;
  final String imagePath;

  CategoryData({required this.name, required this.imagePath});
}

/// Category UI Component (Now Accepting Data Dynamically)
class CategoryListComponent extends StatelessWidget {
  final List<CategoryData> categories; // Accepts categories dynamically

  CategoryListComponent({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header - Categories + View All Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories", style: boldTextStyle(size: 16)),
              TextButton(
                onPressed: () => toast("View All Clicked"), // Replace with actual navigation
                child: Text("View All", style: boldTextStyle(color: primaryColor, size: 14)),
              ),
            ],
          ),
        ),

        /// Horizontal Scrollable Category List
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: List.generate(categories.length, (index) {
              final category = categories[index];

              return Column(
                children: [
                  /// Circular Category Icon
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100], // Background color
                    ),
                    child: Image.asset(category.imagePath, height: 45, width: 45, fit: BoxFit.cover), // Category Image
                  ),

                  8.height, // Spacing

                  /// Category Name
                  Text(category.name, style: primaryTextStyle(size: 12)),
                ],
              ).paddingRight(index == categories.length - 1 ? 0 : 25); // ✅ Padding only between elements
            }),
          ),
        ),

      ],
    );
  }
}
