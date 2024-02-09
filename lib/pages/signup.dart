import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/components/input_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key, required this.doSignUp});

  final void Function() doSignUp;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/sky_icon.png',
            width: 180,
            height: 140,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Sign up',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const InputWidget(
            labelText: "Email",
            hintText: "Please Input Your Email",
          ),
          const InputWidget(
            labelText: "User Name",
            hintText: "Please Input Your User Name",
          ),
          const InputWidget(
            labelText: "Password",
            hintText: "Create Your password",
          ),
          const InputWidget(
            labelText: "Confirm Password",
            hintText: "Please confirm your password",
          ),
          const SizedBox(
            height: 32,
          ),
          OutlinedButton.icon(
            onPressed: doSignUp,
            icon: const Icon(Icons.account_box_rounded),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 8, 49, 164),
              side: const BorderSide(
                color: Color.fromARGB(255, 8, 49, 164),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            label: const Text(
              'Sign Up',
            ),
          ),
        ],
      ),
    );
  }
}
