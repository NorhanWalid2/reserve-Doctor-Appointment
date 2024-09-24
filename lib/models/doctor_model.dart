import 'dart:ui';

class DoctorInformationModel {
  final String id;
  final String image;
  final String title;
  final String specialist;
  final String hospital;
  final String star;

  DoctorInformationModel({
    required this.id,
    required this.image,
    required this.title,
    required this.specialist,
    required this.hospital,
    required this.star,
  });
}

// models/doctor.dart
class Doctor {
  final String? name;
  final String? specialty;
  final String? hospital;
  final String? status;
  final String? imageUrl;
  final String category;

  Doctor({
    required this.category,
    this.imageUrl,
    this.name,
    this.specialty,
    this.hospital,
    this.status,
  });
}

// models/category.dart
class Category {
  final String label;
  final Color color;

  Category({
    required this.label,
    required this.color,
  });
}
