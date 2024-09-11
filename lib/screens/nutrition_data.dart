import 'package:flutter/material.dart';

class NutritionData extends StatelessWidget {
  const NutritionData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8E5F9),
        title: const Text(
          'Nutrition Data',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 3,
          children: [
            Image.asset(
              'assets/images/food1.png',
            ),
            Image.asset(
              'assets/images/food2.png',
            ),
            Image.asset(
              'assets/images/food3.png',
            ),
            Image.asset(
              'assets/images/food4.png',
            ),
            Image.asset(
              'assets/images/food6.png',
            ),
            Image.asset(
              'assets/images/food5.png',
            ),
          ],
        ),
      ),
    );
  }
}
