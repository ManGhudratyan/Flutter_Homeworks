import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorIos extends StatefulWidget {
  const CalculatorIos({super.key, this.number, this.operator});

  final int? number;
  final String? operator;

  @override
  State<CalculatorIos> createState() => _CalculatorIosState();
}

class _CalculatorIosState extends State<CalculatorIos> {
  final TextEditingController _editingController = TextEditingController();

  void handleAppendText(String text) {
    setState(() {
      if (text == 'AC') {
        _editingController.text = '';
      } else if (text == '=') {
        _evaluateExpression();
      } else {
        if (text == '÷') {
          _editingController.text += '/';
        } else if (text == 'x') {
          _editingController.text += '*';
        } else if (text == ',') {
          if (!_editingController.text.contains(',')) {
            _editingController.text += ',';
          }
        } else {
          _editingController.text += text;
        }
      }
    });
  }

  void _evaluateExpression() {
    try {
      String expression = _editingController.text;

      expression = expression.replaceAll(',', '.');

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      String formattedResult = result.toStringAsFixed(2).replaceAll('.', ',');

      _editingController.text = formattedResult;
    } catch (e) {
      _editingController.text = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Calculator ios',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w100,
              fontSize: 30,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                alignment: Alignment.bottomRight,
                child: TextFormField(
                  controller: _editingController,
                  readOnly: true,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: 16,
                          itemBuilder: (context, index) {
                            final List<dynamic> listElements = [
                              'AC',
                              '+/-',
                              '%',
                              '÷',
                              '7',
                              '8',
                              '9',
                              'x',
                              '4',
                              '5',
                              '6',
                              '-',
                              '1',
                              '2',
                              '3',
                              '+',
                            ];

                            if (index < 16 &&
                                index >= 0 &&
                                index != 3 &&
                                index != 7 &&
                                index != 11 &&
                                index != 15 &&
                                index != 0 &&
                                index != 1 &&
                                index != 2) {
                              return GestureDetector(
                                onTap: () {
                                  handleAppendText(
                                      listElements[index].toString());
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 88, 86, 86),
                                  radius: 50,
                                  child: Text(
                                    listElements[index].toString(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }

                            return GestureDetector(
                              onTap: () {
                                handleAppendText(
                                    listElements[index].toString());
                              },
                              child: Container(
                                width: 200.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: (index == 3 ||
                                          index == 7 ||
                                          index == 11 ||
                                          index == 15)
                                      ? const Color.fromRGBO(241, 163, 59, 1)
                                      : (index == 0 || index == 1 || index == 2)
                                          ? const Color.fromRGBO(
                                              165, 165, 165, 1)
                                          : const Color.fromRGBO(
                                              165, 165, 165, 1),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: Text(
                                    listElements[index].toString(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 130,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            final List<dynamic> additionalItems = [
                              '0',
                              '',
                              ',',
                              '='
                            ];
                            if (index == 3) {
                              return GestureDetector(
                                onTap: () {
                                  handleAppendText(
                                      additionalItems[index].toString());
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(241, 163, 59, 1),
                                  radius: 50,
                                  child: Text(
                                    additionalItems[index].toString(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }
                            if (index == 0) {
                              return GestureDetector(
                                onTap: () {
                                  handleAppendText(
                                      additionalItems[index].toString());
                                },
                                child: Container(
                                  height: 50.0,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(51, 51, 51, 1),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      additionalItems[index].toString(),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return GestureDetector(
                              onTap: () {
                                handleAppendText(
                                    additionalItems[index].toString());
                              },
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    const Color.fromRGBO(51, 51, 51, 1),
                                child: Text(
                                  additionalItems[index].toString(),
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
