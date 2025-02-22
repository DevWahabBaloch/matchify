import 'package:flutter/material.dart';

class DatingEntity {
  final String fullName;
  final String gender;
  final String email;
  final String birthDate;
  final int age;
  final String phone;
  final NetworkImage profilePicture;
  final String country;
  final String title;
  final String distance;
  final String time;
  final String registeredDate;

  DatingEntity(
    String date, {
    required this.fullName,
    required this.gender,
    required this.email,
    required this.birthDate,
    required this.age,
    required this.phone,
    required this.profilePicture,
    required this.country,
    required this.title,
    required this.distance,
    required this.time,
    required this.registeredDate,
  });
}
