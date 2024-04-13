import 'package:flutter/material.dart';
import 'package:get_users_api/logic/user/user_provider.dart';
import 'package:get_users_api/models/user_model.dart';
import 'package:get_users_api/pages/users_info_page.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: context.read<UserProvider>().getUsers(),
      builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 81, 67, 85),
              title: const Text(
                'Members',
                style: TextStyle(
                  color: Color.fromARGB(255, 222, 199, 226),
                  fontWeight: FontWeight.w100,
                  fontSize: 26,
                ),
              ),
            ),
            body: Card(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 213, 191, 226),
                      child: Text(user.username![0]),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.username ?? 'Unknown',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 127, 95, 132),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UsersInfoPage(user: user),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 100, 90, 102),
                            )),
                      ],
                    ),
                    hoverColor: const Color.fromARGB(255, 221, 195, 225),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email ?? "Unknown"),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
