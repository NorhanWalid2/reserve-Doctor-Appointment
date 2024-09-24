import 'package:firebase_project/models/doctor_model.dart';
import 'package:firebase_project/screens/chat_screen_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailScreen({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name!),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor's Image
            Container(
              child: Image.asset(
                doctor.imageUrl!,
                width: 520,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Doctor's Name and Specialty
            Text(
              doctor.name!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '${doctor.specialty} - ${doctor.hospital}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Doctor's Description
            Text(
              'Dr ${doctor.name} is one of the best doctors in the ${doctor.hospital}. He has saved alot patients in the past 3 years. He has also received many awards from domestic and abroad as the best doctor. He is available on a private or schedule.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Additional Info

            const SizedBox(height: 20),
            // Make Appointment Button
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(doctor: doctor), // Navigate to chat
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.chat,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: const Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 40,
                          ),
                          title: const Text(
                            'Appointment Confirmed',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                              'You have an appointment with  ${doctor.name} on 23/5/2024.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                    // Logic to make an appointment
                  },
                  child: const Text(
                    'Make an Appointment',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
