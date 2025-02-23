import 'dart:ui'; // Required for BackdropFilter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:horizonx/screens/register_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/show_snackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;

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
                // Blur effect
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: ConstColors.primaryGoldColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                      text: "Login",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            showSnackBar(context, "Login successfully");
                            await Future.delayed(const Duration(seconds: 2));

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  HomeScreen(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            String message = '';

                            switch (e.code) {
                              case 'invalid-email':
                                message =
                                'The email address is badly formatted.';
                                break;
                              case 'user-not-found':
                                message = 'No user found for that email.';
                                break;
                              case 'wrong-password':
                                message =
                                'Wrong password provided for that user.';
                                break;
                              case 'too-many-requests':
                                message =
                                'Too many login attempts. Please try again later.';
                                break;
                              case 'network-request-failed':
                                message =
                                'Network error. Please check your internet connection.';
                                break;
                              case 'invalid-credential':
                                message =
                                'The credential provided is invalid or expired.';
                                break;
                              case 'requires-recent-login':
                                message = 'Please log in again to continue.';
                                break;
                              default:
                                message = e.code.toString();
                                break;
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
                          "Don’t have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: ConstColors.primaryGoldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        GestureDetector(
                          // onTap: () => signInWithFacebook(),
                          child: Image.asset(
                            '${imageAsset}facebook.png',
                            height: 48,
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        GestureDetector(
                          onTap: () => signInWithGoogle(),
                          child: Image.asset(
                            '${imageAsset}google.png',
                            height: 48,
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            '${imageAsset}apple.png',
                            height: 48,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }


  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;


    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    try {
      await FirebaseAuth.instance.signInWithCredential(credential);


      await Future.delayed(const Duration(seconds: 2));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'invalid-credential':
          message = 'The credential provided is invalid or expired.';
          break;
        case 'operation-not-allowed':
          message = 'Signing in with Google is not enabled.';
          break;
        case 'user-disabled':
          message = 'This user has been disabled.';
          break;
        default:
          message ="a7a";
          break;
      }

      showSnackBar(context, message);
    }
  }
// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//
//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }
}

