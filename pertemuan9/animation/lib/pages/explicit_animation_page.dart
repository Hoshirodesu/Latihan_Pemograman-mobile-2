import 'package:flutter/material.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationPage> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnim;
  late Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _sizeAnim = Tween<double>(begin: 100, end: 200).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
    );

    _colorAnim = ColorTween(
      begin: Colors.blue, 
      end: Colors.red
      ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Container(
                width: _sizeAnim.value,
                height: _sizeAnim.value,
                color: _colorAnim.value,
              );
            },
          ),
          const SizedBox(height: 20),
          Wrap(spacing: 10, children: [
            ElevatedButton(
              onPressed: () => _controller.forward(),
              child: const Text('Forward'),
            ),
            ElevatedButton(
              onPressed: () => _controller.reverse(),
              child: const Text('Reverse'),
            ),
            ElevatedButton(
              onPressed: () => _controller.repeat(reverse: true),
              child: const Text('Repeat'),
            ),
            ElevatedButton(
              onPressed: () => _controller.stop(),
              child: const Text('Stop'),
            ),
          ],
        ),
      ],
    ),
  );
}
}