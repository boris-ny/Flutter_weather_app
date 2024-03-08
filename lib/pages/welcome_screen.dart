import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/pages/dashboard/dashboard.dart';
import 'package:flutter_group6_alu/pages/signin.dart';
import 'package:flutter_group6_alu/pages/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<void> _googleSignIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (!mounted) {
        return;
      }

      if (user != null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => const DashBoard(),
        ));
        var userName = user.displayName;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Signed in $userName')));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error signing in: ${e.message}')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/sky_icon.png',
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'SKYCAST',
          style: GoogleFonts.jockeyOne(
            fontSize: 75,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Your forecast, personalized.',
          style: GoogleFonts.roboto(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => const SignUp(),
            ));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: const BorderSide(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text(
            'Sign Up',
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const SignIn(),
              ));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an acount ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            )),
        const Text(
          'or',
          style: TextStyle(color: Colors.grey, fontSize: 25),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: _googleSignIn,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: const BorderSide(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          label: const Text(
            'Sign in with Google',
          ),
          icon: Image.asset(
            'assets/google.png',
          ),
        )
      ],
    );
  }
}
