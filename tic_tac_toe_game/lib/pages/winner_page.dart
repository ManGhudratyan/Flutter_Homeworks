import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/pages/home_page.dart';
import 'package:tic_tac_toe_game/providers/color_provider.dart';
import 'package:tic_tac_toe_game/providers/symbols_provider.dart';

class WinnerPage extends StatelessWidget {
  const WinnerPage(this.winner, {super.key});

  final String winner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$winner wins!',
              style: const TextStyle(fontSize: 24),
            ),
            TextButton(
              onPressed: () => resetGame(context),
              child: const Text("Play again!"),
            ),
          ],
        ),
      ),
    );
  }

  void resetGame(BuildContext context) {
    Provider.of<SymbolsProvider>(context, listen: false).deleteState();
    Provider.of<ColorProvider>(context, listen: false).deleteState();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
