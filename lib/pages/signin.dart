import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    super.key,
    required this.startDashboardScreen,
  });

  final void Function() startDashboardScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Image(
            image: AssetImage('assets/images/sky_icon.png'),
            width: 180,
            height: 140,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Sign In',
            style: GoogleFonts.roboto(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text("Username",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 350,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                hintText: "Please Enter Username",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Password",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 350,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                hintText: "Please Enter Password",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          OutlinedButton.icon(
            onPressed: startDashboardScreen,
            icon: const Icon(
              Icons.account_circle,
            ),
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
              'Sign In',
            ),
          ),
        ],
      ),
    );
  }
}
