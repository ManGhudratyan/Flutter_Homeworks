import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/gender.dart';
import '../../../core/extensions/check_null_empty.dart';
import '../../logic/user/user_bloc.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  // Gender gender = Gender.other;
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const GetUsersCollectionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
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
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is GetUsersLoaded && state.users.isNullOrEmpty()) {
          return const Scaffold(
            body: Center(child: Text('No members found')),
          );
        } else if (state is GetUsersLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Members page'),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: state.users?.length,
              itemBuilder: (context, index) {
                final user = state.users?[index];
                return Card(
                  child: ListTile(
                    title: Text(user?.name ?? 'No name'),
                    subtitle: Text(user?.email ?? 'No email'),
                    trailing: Text(Gender.fromString(user?.gender ?? '').name),
                  ),
                );
              },
            ),
          );
        } else {
          // return const Scaffold(
          //   body: Center(child: Text('Unexpected state')),
          // );
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
