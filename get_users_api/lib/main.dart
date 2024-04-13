import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_users_api/logic/user/user_provider.dart';
import 'package:get_users_api/pages/users_list_page.dart';
import 'package:get_users_api/services/api_service.dart';
import 'package:provider/provider.dart';

void _setupServices() {
  GetIt.instance.registerFactory(() => ApiService());
}

void main() {
  _setupServices();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(GetIt.instance.get<ApiService>()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserListPage(),
      ),
    ),
  );
}
