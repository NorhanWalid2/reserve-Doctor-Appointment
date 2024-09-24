import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/main.dart';
import 'package:firebase_project/widgets/custom_button.dart';
import 'package:firebase_project/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'Register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? pass;

  String? email;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/WhatsApp Image 2024-09-23 at 01.08.25_89608a99.jpg',
                  width: 100, // Set the width of the image
                  height: 100, // Set the height of the image
                ),
                const SizedBox(height: 60), //
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  onchange: (data) {
                    email = data;
                  },
                  icon: const Icon(Icons.email),
                  obscure: false,
                  hint: "enter your email",
                  labeltextt: 'email',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  onchange: (data) {
                    pass = data;
                  },
                  icon: const Icon(Icons.password),
                  obscure: true,
                  hint: "enter your password",
                  labeltextt: 'password',
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 20),
                CustomButton(
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await registerUser();
                        showSnackBar(
                            context, 'SignUp Sucessfully', Colors.green);
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                            context,
                            'The password provided is too weak.',
                            Colors.red,
                          );
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(
                              context,
                              'The account already exists for that email.',
                              Colors.red);
                        }
                      } catch (e) {
                        showSnackBar(
                            context, 'there is an errorrrr $e', Colors.red);
                      }

                      setState(() {});
                    }
                  },
                  conText: "Sign Up",
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do have an account? '),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text('LogIn')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: pass!,
    );
  }
}
