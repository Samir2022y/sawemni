import 'package:flutter/material.dart';
import 'package:sawemni/themes/colors.dart'; // Assuming custom colors are defined here
import 'package:sawemni/themes/styles.dart'; // Assuming custom styles are defined here

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    // Example decoration for the container

    // TextStyle for the text inside each category

    // List of categories in Arabic
    List<String> categories = [
      'حديد', // Hadid
      'خشب', // Khachab
      'معدن', // Metal
      'زجاج', // Glass
      'بلاستيك', // Plastic
      'قماش', // Fabric
      'ورق', // Paper
      'طين', // Clay
      'أحجار', // Stones
      'سيراميك', // Ceramic
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'البحث',
            style: TextStyle(color: Colors.white),
          ),

          // Arabic title for "Search"
        ),
        backgroundColor:
            orangeColor, // Assuming orangeColor is defined in your colors.dart
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns items to the left
          children: [
            const SizedBox(height: 50),
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Aligns content to the start
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign
                          .right, // Makes text align to the right for Arabic input
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ابحث', // Updated placeholder text
                        hintStyle: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: double.infinity, // Makes the container take full width
                child: const Text(
                  ":البحث في الأصناف",
                  style: addProductStyle,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            // Categories
            Wrap(
              alignment: WrapAlignment.end, // Aligns the categories to the left
              spacing: 10,
              runSpacing: 10,
              children: categories
                  .map(
                    (category) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration:
                          decobox, // Assuming your decoration is defined
                      child: Text(
                        category,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
