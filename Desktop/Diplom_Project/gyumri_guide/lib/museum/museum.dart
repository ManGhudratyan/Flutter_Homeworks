import 'package:flutter/material.dart';

class MuseumPage extends StatefulWidget {
  const MuseumPage({super.key});

  @override
  State<MuseumPage> createState() => _MuseumPageState();
}

class _MuseumPageState extends State<MuseumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Musuem page'),
      ),
    );
  }
}
