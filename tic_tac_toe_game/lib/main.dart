import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/pages/home_page.dart';
import 'package:tic_tac_toe_game/providers/color_provider.dart';
import 'package:tic_tac_toe_game/providers/symbols_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ColorProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SymbolsProvider(),
      )
    ],
    child: const HomePage(),
  ));
}
