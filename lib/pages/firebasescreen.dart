import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/firebase_options.dart';

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  void _getUsers() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;

  // final CollectionReference users = db.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
    );
  }
}
