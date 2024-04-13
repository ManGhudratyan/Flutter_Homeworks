import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/pages/winner_page.dart';
import 'package:tic_tac_toe_game/providers/color_provider.dart';
import 'package:tic_tac_toe_game/providers/symbols_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String?> _board;
  bool _isBoardEmpty = true;

  @override
  void initState() {
    super.initState();
    _board = List.filled(9, null);
  }

  @override
  Widget build(BuildContext context) {
    _isBoardEmpty = _board.every((element) => element == null);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Tic Tac Toe',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 30, right: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text(
                  _isBoardEmpty
                      ? "Please wait"
                      : "${Provider.of<SymbolsProvider>(context).currentSymbol} turn",
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              GridView.builder(
                itemCount: 9,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (_board[index] == null) {
                        Provider.of<ColorProvider>(context, listen: false)
                            .changeColor(index);
                        setState(() {
                          _board[index] = Provider.of<SymbolsProvider>(context,
                                  listen: false)
                              .currentSymbol;
                          Provider.of<SymbolsProvider>(context, listen: false)
                              .toggleSymbol();
                        });
                        checkWinner(context);
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color:
                            Provider.of<ColorProvider>(context).getColor(index),
                        border: Border.all(
                          width: 3,
                          color: Provider.of<ColorProvider>(context)
                              .getContainerBorderColor(_board, index),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _board[index] ?? "",
                        style: TextStyle(
                            color: _board[index] == 'O'
                                ? Colors.red
                                : const Color.fromRGBO(36, 117, 197, 1.00),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkWinner(BuildContext context) {
    List<List<int>> winningConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    bool isBoardFull = !_board.contains(null);

    for (final condition in winningConditions) {
      final symbol1 = _board[condition[0]];
      final symbol2 = _board[condition[1]];
      final symbol3 = _board[condition[2]];

      if (symbol1 != null && symbol1 == symbol2 && symbol2 == symbol3) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WinnerPage(symbol1),
          ),
        );
        return;
      }
    }

    if (isBoardFull) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WinnerPage("Nobody"),
        ),
      );
    }
  }
}
