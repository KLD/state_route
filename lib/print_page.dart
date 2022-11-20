import 'package:flutter/material.dart';

class PrintPage extends StatelessWidget {
  final String name;

  const PrintPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text(
          "Print",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text("Hello $name"),
      ),
    );
  }
}
