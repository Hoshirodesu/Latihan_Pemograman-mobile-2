import 'package:flutter/material.dart';

class TransitionExamplePage extends StatelessWidget{
  const TransitionExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Transition Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/interactive');
          },
          child: const Text('Go to Next Page (slide transition)'),
        ),
      ),
    );
  }
}