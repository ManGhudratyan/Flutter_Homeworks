import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../logic/user/user_bloc.dart';
import '../../widgets/general/app_button.dart';
import '../login/login_page.dart';
import '../members/members_page.dart';
import '../profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.userModel});
  final UserEntity? userModel;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'),
        centerTitle: true,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error ?? 'An error occurred'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'You have signed in with this email ${state.userModel?.email ?? ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 100,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 60, top: 20, bottom: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      if (state.userModel != null) {
                                        _deleteUserFunc(
                                            context, state.userModel!.userId!);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'User data is not available'),
                                          ),
                                        );
                                      }
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.delete),
                                        Text(
                                          'Delete user',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Row(
                                    children: [
                                      Icon(Icons.logout),
                                      Text(
                                        'Log out user',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.account_box,
                      size: 40,
                      color: Color.fromARGB(255, 102, 114, 124),
                    ),
                  ),
                ),
                AppButton(
                  onPressed: () {
                    if (state.userModel != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(userModel: state.userModel),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User data is not available'),
                        ),
                      );
                    }
                  },
                  title: 'Go to profile page',
                ),
                const SizedBox(height: 20),
                AppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MembersPage(),
                      ),
                    );
                  },
                  title: 'See all the members',
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  void _deleteUserFunc(BuildContext context, String userId) {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Contact'),
        content: const Text('Are you sure you want to delete this contact?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<UserBloc>().add(
                    DeleteUserFromDbEvent(userId),
                  );
              Navigator.pop(context, 'OK');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
