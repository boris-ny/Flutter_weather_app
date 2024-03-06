import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
    required this.startDashboardScreen,
  }) : super(key: key);

  final void Function() startDashboardScreen;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  var _email = "";
  var _password = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save form fields

      try {
        UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (credential.user != null) {
          widget.startDashboardScreen(); // Navigate to the dashboard screen
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid email or password')),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid email or password')),
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Image(
              image: AssetImage('assets/images/sky_icon.png'),
              width: 180,
              height: 140,
            ),
            const SizedBox(height: 32),
            Text(
              'Sign In',
              style: GoogleFonts.roboto(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'Invalid email';
                }
                return null;
              },
              onSaved: (newValue) => _email = newValue!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
              onSaved: (newValue) => _password = newValue!,
            ),
            const SizedBox(height: 32),
            OutlinedButton.icon(
              onPressed: _signIn,
              icon: const Icon(Icons.account_circle),
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
              label: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
