import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  void _deleteUser(String documentId) async {
    try {
      await db.collection('users').doc(documentId).delete();
      // Trigger a rebuild of the widget tree
      setState(() {});
    } catch (error) {
      Text("Error deleting user: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
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
                final docData = documents[index].data();
                final docId = documents[index].id;

                return Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          docData.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          docId,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UpdateOverlay(documentId: docId),
                            ));
                          },
                          child: const Text('UPDATE'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _deleteUser(docId);
                          },
                          child: const Text('DELETE'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class UpdateOverlay extends StatefulWidget {
  final String documentId;

  UpdateOverlay({required this.documentId});

  @override
  _UpdateOverlayState createState() => _UpdateOverlayState();
}

class _UpdateOverlayState extends State<UpdateOverlay> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void updateDocument() async {
    String email = emailController.text;
    String name = nameController.text;
    String password = passwordController.text;

    await db.collection('users').doc(widget.documentId).update({
      'email': email,
      'name': name,
      'password': password,
    });
    if (!mounted) {
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'Update Document Overlay',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateDocument,
              child: const Text('Update Document'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
