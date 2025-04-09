import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('To-do Screen', style: TextStyle(fontSize: 20))),
    );
  }
}
