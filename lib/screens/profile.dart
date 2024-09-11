import 'package:bmi_calculator/helpers/app_button.dart';
import 'package:bmi_calculator/models/profile_tile.dart';
import 'package:bmi_calculator/screens/signin.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8E5F9),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: profileTiles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(
                        profileTiles[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: profileTiles[index].trailer,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: AppButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signin(),
                      ),
                      (route) => false);
                },
                text: 'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
