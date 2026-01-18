import 'package:flutter/material.dart';
import 'package:animation/pages/implicit_animation_page.dart';
import 'package:animation/pages/explicit_animation_page.dart';
import 'package:animation/pages/interactive_animation_page.dart';
import 'package:animation/pages/transition_animation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/implicit': (context) => const ImplicitAnimationPage(),
        '/explicit': (context) => const ExplicitAnimationPage(),
        '/interactive': (context) => const InteractiveAnimationPage(),
        '/transition': (context) => const TransitionExamplePage(),
      },

      onGenerateRoute: (settings) {
        if (settings.name == '/interactive') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const TransitionExamplePage(),
            transitionsBuilder: (_, animation, __, child) {
              final offset = Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation);
              return SlideTransition(position: offset, child: child);
            },
          );
        }
        return null;
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Demo Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/implicit');
              },
              child: const Text('Implicit Animation (AnimatedContainer)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/explicit');
              },
              child: const Text('Explicit Animation (AnimationController)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transition');
              },
              child: const Text('Page transition (Slide)'),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/interactive');
              },
              child: const Text('Interactive Animation (GestureDetector)'),
            ),
          ],
        ), 
      ),
    );
  }
}