import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/doctor_model.dart';
import 'package:firebase_project/screens/doctor_details_screen.dart';
import 'package:firebase_project/screens/doctor_list_screen.dart';
import 'package:firebase_project/screens/menu.dart';
import 'package:flutter/material.dart';

List<Doctor> doctors = [];

class HomeScreen extends StatefulWidget {
  static String id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  Future<void> getInfo() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Doctor').get();
    List<Doctor> fetchedDoctors = querySnapshot.docs.map((doc) {
      return Doctor(
        name: doc['name'],
        specialty: doc['specialty'],
        hospital: doc['hospital'],
        status: doc['status'],
        imageUrl: doc['imageUrl'],
        category: doc['category'],
      );
    }).toList();

    setState(() {
      doctors = fetchedDoctors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find Your Doctor',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Find your doctor'),
          actions: const [
            CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/download (1).jpg')
                // If you want to use a network image, use Image.network()
                // backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                ),
          ],
        ),
        drawer: Drawer(
          child: MenuScreen(), // Set your menu screen here
        ),
        body: Column(
          children: [
            // Search Bar
            const SizedBox(
              height: 20,
            ),
            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: categories
                    .map((category) => CategoryCard(
                        label: category.label, color: category.color))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Top Doctors List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: doctors
                    .map((doctor) => DoctorCard(
                          name: doctor.name!,
                          specialty: doctor.specialty!,
                          hospital: doctor.hospital!,
                          status: doctor.status!,
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
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample Data
final List<Category> categories = [
  Category(label: 'Consultation', color: Colors.blue),
  Category(label: 'Dental', color: Colors.purple),
  Category(label: 'Heart', color: Colors.red),
  Category(label: 'Hospitals', color: Colors.orange),
  Category(label: 'Medicines', color: Colors.green),
  Category(label: 'Physician', color: Colors.cyan),
  Category(label: 'Skin', color: Colors.pink),
  Category(label: 'Surgeon', color: Colors.amber),
];

class CategoryCard extends StatelessWidget {
  final String label;
  final Color color;

  const CategoryCard({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorListScreen(
              category: label,
              doctors: doctors,
            ), // Pass selected category
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DoctorCard extends StatelessWidget {
  final String? name;
  final String? specialty;
  final String? hospital;
  final String? status;
  final String? image;
  final VoidCallback onTap;
  Doctor? doctor;
  DoctorCard({
    super.key,
    this.name,
    this.specialty,
    this.hospital,
    this.status,
    required this.onTap,
    this.doctor,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: Image.asset(
                  image!,
                  height: 60,
                  width: 60,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(specialty!, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(hospital!, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(status!, style: const TextStyle(color: Colors.green)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future getInfo() async {
  FirebaseFirestore.instance
      .collection('Doctor')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc["name"]);
    });
  });
}
