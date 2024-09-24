import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.conText, this.ontap});
  String conText;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(230, 6, 95, 115), // Start color
                Color.fromARGB(255, 74, 146, 156),
                Color.fromARGB(255, 143, 227, 238), // End color
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            conText,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
