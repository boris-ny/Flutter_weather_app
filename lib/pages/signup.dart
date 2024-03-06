import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_group6_alu/pages/signin.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.doSignUp}) : super(key: key);

  final void Function() doSignUp;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  var _email = "";
  var _password = "";

  Future<void> _createUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save form fields

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (!mounted) {
          return;
        }

        if (userCredential.user != null) {
          // User account created successfully, you can proceed with navigation or any other action
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SignIn(
                startDashboardScreen: () {},
              ),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('The email address is already in use.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred: ${e.message}')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $error')),
        );
      }
    }
  }

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
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                filled: true,
              ),
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'Invalid email';
                }
                return null;
              },
              onSaved: (newValue) => _email = newValue!,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                fillColor: Colors.white,
                filled: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                return null;
              },
              onSaved: (newValue) => _password = newValue!,
              obscureText: true,
            ),
            const SizedBox(
              height: 32,
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
                'Sign Up',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
