import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black12,
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Image(
                  image: AssetImage('assets/sun.png'),
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
                Text("Username",
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter Username",
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Password",
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
