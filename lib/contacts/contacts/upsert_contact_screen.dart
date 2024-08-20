import 'package:flutter/material.dart';

class UpsertContactScreen extends StatefulWidget {
  const UpsertContactScreen({super.key});

  @override
  State<UpsertContactScreen> createState() => _UpsertContactScreenState();
}

class _UpsertContactScreenState extends State<UpsertContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpsertContactScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UpsertContactScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
