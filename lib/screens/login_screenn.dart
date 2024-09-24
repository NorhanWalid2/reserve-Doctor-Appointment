import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/main.dart';
import 'package:firebase_project/screens/home_Screen.dart';
import 'package:firebase_project/screens/signup_screen.dart';
import 'package:firebase_project/widgets/custom_button.dart';
import 'package:firebase_project/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? pass;

  String? email;
  bool isLoading = false;
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
                const SizedBox(height: 60),
                const Text(
                  'Login',
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
                const SizedBox(height: 10),
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
                        await loginUser();
                        showSnackBar(
                            context, 'Login Sucessfully', Colors.green);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context, 'No user found for that email.',
                              Colors.red);
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(
                              context,
                              'Wrong password provided for that user.',
                              Colors.red);
                        } else {
                          showSnackBar(
                              context,
                              'opssss there is an error: ${e.message}',
                              Colors.red);
                        }
                      }
                    }
                  },
                  conText: "Login",
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: const Text('Sign Up')),
                  ],
                ),

                const SizedBox(
                    height: 20), // Space before Google Sign-in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        try {
                          await signInWithGoogle();
                          showSnackBar(
                              context, 'SignIn Sucessfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context,
                                'No user found for that email.', Colors.red);
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(
                                context,
                                'Wrong password provided for that user.',
                                Colors.red);
                          } else {
                            showSnackBar(
                                context,
                                'opssss there is an error: ${e.message}',
                                Colors.red);
                          }
                        }
                      },
                      child: Container(
                        child: Image.asset(
                          'assets/icons/WhatsApp Image 2024-09-23 at 10.32.57_508847a7.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    GestureDetector(
                      onTap: () async {
                        try {
                          await signInWithFacebook();
                          showSnackBar(
                              context, 'SignIn Sucessfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context,
                                'No user found for that email.', Colors.red);
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(
                                context,
                                'Wrong password provided for that user.',
                                Colors.red);
                          } else {
                            showSnackBar(
                                context,
                                'opssss there is an error: ${e.message}',
                                Colors.red);
                          }
                        }
                      },
                      child: Container(
                        child: Image.asset(
                          'assets/icons/WhatsApp Image 2024-09-23 at 10.32.57_3ac0fb29.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: pass!,
    );
  }
}

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
