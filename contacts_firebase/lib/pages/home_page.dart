import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_firebase/pages/save_contact_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('contacts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(color: Color.fromARGB(255, 98, 96, 96)),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic>? data =
                  document.data() as Map<String, dynamic>?;

              if (data != null &&
                  data['name'] != null &&
                  data['phoneNumber'] != null) {
                final phoneNumber = data['phoneNumber']?.toString() ?? '';
                return Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 125, 106, 127),
                      child: Icon(
                        Icons.contact_page,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      data['name'] ?? '',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 118, 106, 121),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      phoneNumber,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add contact',
          ),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SaveContactPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
