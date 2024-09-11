import 'package:flutter/material.dart';

class ProfileTile {
  String title;
  Widget trailer;

  ProfileTile({
    required this.title,
    required this.trailer,
  });
}

List<ProfileTile> profileTiles = [
  ProfileTile(
    title: 'Gender ',
    trailer: const Icon(
      Icons.female,
      color: Colors.pink,
      size: 30,
    ),
  ),
  ProfileTile(
    title: 'Age',
    trailer: const Text(
      '21 Yrs',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  ProfileTile(
    title: 'Height',
    trailer: const Text(
      '170 Cm',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  ProfileTile(
    title: 'Intial Weight',
    trailer: const Text(
      '58.0 kg',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  ProfileTile(
    title: 'Target Weight',
    trailer: const Text(
      '55.0 kg',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  ProfileTile(
    title: 'Current Weight',
    trailer: const Text(
      '58.0 kg',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
];
