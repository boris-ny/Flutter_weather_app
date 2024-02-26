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
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot>> getData() async {
    QuerySnapshot querySnapshot = await db.collection('users').get();
    final docSnapshots = querySnapshot.docs;
    return docSnapshots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          'Users',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }

          if (snapshot.hasData) {
            final documents = snapshot.data!;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                // Access document data here
                final docData = documents[index].data();
                // ... use docData to build your list items
                return Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      docData.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ); // Replace with your logic
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
