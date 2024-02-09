import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
    required this.startSignUp,
    required this.startSignIn,
  });

  final void Function() startSignUp;
  final void Function() startSignIn;

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
          onPressed: startSignUp,
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
          height: 38,
        ),
        TextButton(
            onPressed: startSignIn,
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
            ))
      ],
    );
  }
}
