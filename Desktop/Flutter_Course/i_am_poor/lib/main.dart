import 'package:flutter/material.dart';

void main() {
  runApp(const IAmPoor());
}

class IAmPoor extends StatefulWidget {
  const IAmPoor({super.key});

  @override
  State<IAmPoor> createState() => _IAmPoorState();
}

class _IAmPoorState extends State<IAmPoor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I Am Poor', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: const Center(
          child: Image(image: AssetImage('images/poor.png')),
        ),
      ),
    );
  }
}
