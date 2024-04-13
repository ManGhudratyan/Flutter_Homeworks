import 'package:flutter/material.dart';
import 'package:get_users_api/models/user_model.dart';

class UsersInfoPage extends StatelessWidget {
  final UserModel user;

  const UsersInfoPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Text(
                      "User detailed information ",
                      style: TextStyle(color: Colors.purple, fontSize: 25),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 213, 191, 226),
                        child: Text(
                          user.username![0],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Username: ${user.username ?? 'Unknown'}',
                    ),
                    const Divider(),
                    Text(
                      'Name: ${user.name ?? 'Unknown'}',
                    ),
                    const Divider(),
                    Text(
                      'Phone: ${user.phone ?? 'Unknown'}',
                    ),
                    const Divider(),
                    Text(
                      'Email: ${user.email ?? 'Unknown'}',
                    ),
                    const Divider(),
                    Text(
                      'Website: ${user.website ?? 'Unknown'}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
