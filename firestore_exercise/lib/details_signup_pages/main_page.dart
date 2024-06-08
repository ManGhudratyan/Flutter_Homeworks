import 'package:firestore_exercise/logic/user/user_bloc.dart';
import 'package:firestore_exercise/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.userModel});
  final UserModel? userModel;

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
                content: Text(state.error ?? ''),
              ),
            );
          }
        },
        builder: (context, state) {
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
                      builder: (BuildContext context) {
                        return const SizedBox(
                          height: 100,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 60, top: 20, bottom: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
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
                                  SizedBox(height: 20),
                                  Row(
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
                  child: const Icon(Icons.settings),
                ),
                ElevatedButton(
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
                  child: const Text('Go to profile page'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
