import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  final String username;
  final String fullName;
  final String email;

  const ProfileScreen(this.username, this.fullName, this.email, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String phoneNumber = '';
  String address = '';
  File? _image;

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Stack(
                children: [
                  GestureDetector(
                    onTap: _getImageFromGallery,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : const AssetImage('images/user.png')
                              as ImageProvider,
                    ),
                  ),
                  CircleAvatar(
                    child: Positioned(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          onPressed: _getImageFromGallery,
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            size: 25,
                            weight: BorderSide.strokeAlignOutside,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome, ${widget.username}!',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              itemProfile('Full Name', widget.fullName, Icons.person, null),
              const SizedBox(height: 10),
              itemProfile(
                  'Username', widget.username, CupertinoIcons.person, null),
              const SizedBox(height: 10),
              itemProfile('Email', widget.email, Icons.email, null),
              const SizedBox(height: 10),
              itemProfile(
                  'Phone Number',
                  phoneNumber.isNotEmpty ? phoneNumber : '',
                  CupertinoIcons.phone, () {
                _showAddInfoDialog(context, 'Phone Number', (String value) {
                  setState(() {
                    phoneNumber = value;
                  });
                });
              }),
              const SizedBox(height: 10),
              itemProfile('Address', address.isNotEmpty ? address : '',
                  CupertinoIcons.location, () {
                _showAddInfoDialog(context, 'Address', (String value) {
                  setState(() {
                    address = value;
                  });
                });
              }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddInfoDialog(
      BuildContext context, String title, Function(String) onAdd) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newValue = '';
        return AlertDialog(
          title: Text('Add $title'),
          content: TextField(
            onChanged: (value) {
              newValue = value;
            },
            decoration: InputDecoration(
              labelText: 'Enter $title',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onAdd(newValue);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget itemProfile(
      String title, String subtitle, IconData iconData, Function()? onAdd) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: const Color.fromARGB(255, 41, 40, 40).withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: IconButton(
          icon: const Icon(Icons.add, color: Colors.grey),
          onPressed: onAdd,
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
