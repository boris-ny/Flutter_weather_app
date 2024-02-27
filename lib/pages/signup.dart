// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  var _name = "";
  var _email = "";
  var _password = "";

  Future<void> _createUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save form fields

      final FirebaseFirestore db =
          FirebaseFirestore.instance; // Use initialized instance
      try {
        await db.collection('users').add({
          'name': _name,
          'email': _email,
          'password': _password, // Handle password securely
        });
        if (!context.mounted) {
          return;
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const FirebaseScreen(),
          ),
        );
      } catch (error) {
        SnackBar(
          content: Text(error.toString()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Firebase Assignment",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FirebaseScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.forward,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                decoration: const InputDecoration(
                  label: Text('Email'),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length >= 50) {
                    return 'Must be between 1 and 50';
                  }
                  return null;
                },
                onSaved: (newValue) => _email = newValue!,
              ),
              const SizedBox(
                height: 12,
              ),
              // const InputWidget(
              //   labelText: "User Name",
              //   hintText: "Please Input Your User Name",
              // ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('User Name'),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length >= 50) {
                    return 'Must be between 1 and 50';
                  }
                  return null;
                },
                onSaved: (newValue) => _name = newValue!,
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Password'),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length >= 50) {
                    return 'Must be between 1 and 50';
                  }
                  return null;
                },
                onSaved: (newValue) => _password = newValue!,
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
                onPressed: _createUser,
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
      ),
    );
  }
}
