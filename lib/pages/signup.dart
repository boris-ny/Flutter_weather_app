// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/components/input_widget.dart';
import 'package:flutter_group6_alu/pages/firebasescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.doSignUp});

  final void Function() doSignUp;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  void _createUser() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      child: Form(
        key: _formKey,
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
            // const InputWidget(
            //   labelText: "Email",
            //   hintText: "Please Input Your Email",
            // ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Email')),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length >= 50) {
                  return 'Must be between 1 and 50';
                }
                return null;
              },
              onSaved: (newValue) {},
            ),
            const SizedBox(
              height: 12,
            ),
            // const InputWidget(
            //   labelText: "User Name",
            //   hintText: "Please Input Your User Name",
            // ),
            TextFormField(
              decoration: const InputDecoration(label: Text('User Name')),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length >= 50) {
                  return 'Must be between 1 and 50';
                }
                return null;
              },
              onSaved: (newValue) {},
            ),
            // const InputWidget(
            //   labelText: "Password",
            //   hintText: "Create Your password",
            // ),

            TextFormField(
              decoration: const InputDecoration(label: Text('Password')),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length >= 50) {
                  return 'Must be between 1 and 50';
                }
                return null;
              },
              onSaved: (newValue) {},
            ),

            // const InputWidget(
            //   labelText: "Confirm Password",
            //   hintText: "Please confirm your password",
            // ),
            const SizedBox(
              height: 32,
            ),
            OutlinedButton.icon(
              onPressed: widget.doSignUp,
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
            const SizedBox(
              height: 12,
            ),
            OutlinedButton.icon(
              onPressed: () {
                _createUser();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const FirebaseScreen(),
                  ),
                );
              },
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
                'Firebase Button',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
