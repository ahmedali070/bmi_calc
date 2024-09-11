import 'package:flutter/material.dart';

class WeightTracker extends StatelessWidget {
  const WeightTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8E5F9),
        title: const Text(
          'Weight Tracker',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'November 24, 2023',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/chart.png',
            ),
            const SizedBox(height: 30),
            buildWeightCard('Current', '58.0 KG', double.infinity),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildWeightCard('Target', '55.0 KG', 150),
                buildWeightCard('Intial', '58.0 KG', 150),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildWeightCard('Change', '2.0 KG', 150),
                buildWeightCard('Remaining', '-3.0 KG', 150),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildWeightCard(String text, String value, double width) {
    return Container(
      height: 100,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
