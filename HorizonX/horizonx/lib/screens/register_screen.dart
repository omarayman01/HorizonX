import 'dart:ui'; // Required for BackdropFilter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horizonx/screens/login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/show_snackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? name, email, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${imageAsset}background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),

            // Login Form Layer
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                    const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: ConstColors.primaryGoldColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      hintText: "Name",
                      obscure: false,
                      onChanged: (data) {
                        name = data;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Email",
                      obscure: false,
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    const SizedBox(height: 20),

                    CustomTextField(
                      hintText: "Password",
                      obscure: true,
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: "Register",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser();
                            showSnackBar(context, "Registered successfully");
                            await Future.delayed(const Duration(seconds: 2));

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  HomeScreen(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            String message = '';

                            if (e.code == 'weak-password') {
                              message = 'The password provided is too weak.';
                            } else if (e.code == 'email-already-in-use') {
                              message =
                              'The account already exists for that email.';
                            } else if (e.code == 'invalid-email') {
                              message = 'The email address is badly formatted.';
                            } else if (e.code == 'operation-not-allowed') {
                              message =
                              'Email/password accounts are not enabled.';
                            } else {
                              message = 'Error: ${e.message}';
                            }
                            showSnackBar(context, message);
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      },
                    ),

                    const SizedBox(height: 100), // Adjusted spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: ConstColors.primaryGoldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerUser() async{
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

}