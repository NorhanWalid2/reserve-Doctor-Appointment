import 'package:firebase_project/models/doctor_model.dart';
import 'package:firebase_project/screens/doctor_details_screen.dart';
import 'package:firebase_project/screens/home_Screen.dart';
import 'package:flutter/material.dart';

class DoctorListScreen extends StatelessWidget {
  final String category;
  final List<Doctor> doctors; // Accept the list of doctors

  const DoctorListScreen({
    required this.category,
    required this.doctors, // Add the doctors to the constructor
  });

  @override
  Widget build(BuildContext context) {
    // Filter doctors based on the selected category
    final filteredDoctors =
        doctors.where((doctor) => doctor.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Doctors'),
      ),
      body: filteredDoctors.isEmpty
          ? const Center(child: Text('No doctors available in this category.'))
          : ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return DoctorCard(
                  name: doctor.name,
                  specialty: doctor.specialty,
                  hospital: doctor.hospital,
                  status: doctor.status,
                  doctor: doctor,
                  image: doctor.imageUrl,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DoctorDetailScreen(doctor: doctor),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
