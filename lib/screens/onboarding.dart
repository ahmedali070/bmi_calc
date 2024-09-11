import 'package:bmi_calculator/helpers/app_button.dart';
import 'package:bmi_calculator/models/onboarding.dart';
import 'package:bmi_calculator/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: 'Track Your Health',
    description:
        'Monitor your Body Mass Index (BMI) to keep \ntrack of your fitness journey.',
    image: 'assets/images/onboarding1.png',
  ),
  OnboardingModel(
    title: 'Easy BMI Calculation',
    description:
        'Enter your weight and height to instantly \ncalculate your BMI.',
    image: 'assets/images/onboarding2.png',
  ),
  OnboardingModel(
    title: 'Get Personalized Insights',
    description:
        'Receive customized recommendations \nbased on your BMI results.',
    image: 'assets/images/onboarding3.png',
  ),
];

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Welcome(),
                ),
                (route) => true,
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFF412A9E),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardingData[index].image),
                      const SizedBox(height: 40),
                      Text(
                        onboardingData[index].title,
                        style: const TextStyle(
                          color: Color(0xFF121420),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        onboardingData[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFA5A7AC),
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: onboardingData.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xFF412A9E),
                dotColor: Color(0xFFC4C4C4),
                dotHeight: 15,
                dotWidth: 15,
                spacing: 8,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: AppButton(
            onPressed: () {
              if (_currentIndex == onboardingData.length - 1) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Welcome(),
                  ),
                  (route) => false,
                );
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            text: _currentIndex == onboardingData.length - 1
                ? 'Get Started'
                : 'Next',
          ),
        ),
      ),
    );
  }
}
