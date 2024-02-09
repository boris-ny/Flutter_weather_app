import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO : @Manzi is doing the sign in screen
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Image(
          image: AssetImage('assets/sky_icon.png'),
          width: 180,
          height: 140,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Sign In',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
        SizedBox(
          height: 30,
        ),
        Text("Username", style: TextStyle(color: Colors.white, fontSize: 20.0)),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 350,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              hintText: "Please Enter Username",
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Password",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
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
      ],
    );
  }
}
