import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gyumri_guide/cubit/app_cubit_logics.dart';
import 'package:gyumri_guide/cubit/app_cubits.dart';
import 'package:gyumri_guide/db/preference_service.dart';
import 'package:gyumri_guide/pages/signup_screen.dart';
import 'package:gyumri_guide/restaurants_component/favorite_provider.dart';
import 'package:gyumri_guide/services/data_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WebView.platform = SurfaceAndroidWebView();
  WidgetsFlutterBinding.ensureInitialized();
  await _setupServices();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const MyApp(),
          '/sign-up': (context) => const SignUpScreen(),
        },
      ),
    ),
  );
}

Future<void> _setupServices() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  GetIt.instance.registerLazySingleton(() => PreferenceService(preferences));
  GetIt.instance.registerLazySingleton(() => DataServices());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: const AppCubitLogics(),
      ),
    );
  }
}
