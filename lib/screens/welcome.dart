import 'package:bmi_calculator/helpers/app_button.dart';
import 'package:bmi_calculator/screens/signin.dart';
import 'package:bmi_calculator/screens/signup.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/welcome.png'),
              const SizedBox(height: 20),
              const Text(
                'Welcome to BMI Cal+',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Best guide for calculating \nyour body mass index.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: AppButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signin(),
                        ),
                        (route) => false,
                      );
                    },
                    text: 'Sign in'),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 250,
                height: 50,
                child: AppButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signup(),
                        ),
                        (route) => false,
                      );
                    },
                    text: 'Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
