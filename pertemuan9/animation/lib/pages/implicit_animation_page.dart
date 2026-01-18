import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  bool _isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: _isBig ? 200 : 100,
            height: _isBig ? 200 : 100,
            decoration: BoxDecoration(
              color: _isBig ? Colors.deepPurple : Colors.orange,
              borderRadius: BorderRadius.circular(_isBig ? 0 : 20),
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() => _isBig = !_isBig);
            },
            child: const Text('Animate')
          ),
        ],        
      ),
    );
  }
}