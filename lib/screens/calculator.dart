import 'package:bmi_calculator/helpers/app_button.dart';
import 'package:bmi_calculator/helpers/app_text_field.dart';
import 'package:bmi_calculator/screens/bmi_result.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isFemale = false;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8E5F9),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      isFemale = false;
                    }),
                    child: sexCard(
                      false,
                      !isFemale,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      isFemale = true;
                    }),
                    child: sexCard(
                      true,
                      isFemale,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                width: 320,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: containerItem('Age', ageController),
              ),
              const SizedBox(height: 20),
              Container(
                width: 320,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    containerItem('Height (ⅽⅿ)', heightController),
                    const SizedBox(height: 20),
                    containerItem('Weight (kg)', weightController),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: 200,
                height: 50,
                child: AppButton(
                  onPressed: () {
                    final double height = double.parse(heightController.text);
                    final double weight = double.parse(weightController.text);

                    final double bmi =
                        weight / ((height / 100) * (height / 100));
                    final String result = bmi.toStringAsFixed(1);

                    String interpretation;
                    if (bmi < 18.5) {
                      interpretation = 'Underweight';
                    } else if (bmi < 24.9) {
                      interpretation = 'Normal';
                    } else if (bmi < 29.9) {
                      interpretation = 'Overweight';
                    } else {
                      interpretation = 'Obese';
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BmiResult(
                          bmiResult: result,
                          interpretation: interpretation,
                        ),
                      ),
                    );
                  },
                  text: 'Calculate',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row containerItem(String text, TextEditingController controler) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$text:',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 100,
          child: AppTextField(
            controller: controler,
            obscureText: false,
            fillColor: const Color(0xFFD9D9D9),
            radius: 50,
          ),
        )
      ],
    );
  }

  Container sexCard(bool isMale, bool isSelected) {
    return Container(
      width: 140,
      height: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(
                color:
                    isMale ? const Color(0xFF7BACFF) : const Color(0xFFFF7BAC),
                width: 3,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            isMale ? Icons.male : Icons.female,
            size: 70,
            color: isMale ? const Color(0xFF7BACFF) : const Color(0xFFFF7BAC),
          ),
          Text(
            isMale ? 'Male' : 'Female',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
