import 'package:flutter/material.dart';

class FavoScreen extends StatefulWidget {
  const FavoScreen({super.key});

  @override
  State<FavoScreen> createState() => _FavoScreenState();
}

class _FavoScreenState extends State<FavoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 60, 172, 247),
        title: const Text(
          'Favorite',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
