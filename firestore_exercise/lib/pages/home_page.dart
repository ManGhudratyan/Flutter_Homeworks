import 'package:firestore_exercise/logic/auth/auth_bloc.dart';
import 'package:firestore_exercise/models/user_model.dart';
import 'package:firestore_exercise/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.userModel});
  final UserModel? userModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? ''),
            ),
          );
        } else if (state is AuthStateSignedOut) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home page'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'You have succesfully signed in with your google account',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 226, 190, 233),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    child: const Text('Go to profile page'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(SignOutEvent());
                    },
                    child: const Text('Sign out'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
