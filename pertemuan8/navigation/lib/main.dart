import 'package:flutter/material.dart';
import 'package:navigation/secondpage.dart';
import 'package:navigation/detailpage.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final argument = state.extra as String?;
          return DetailPage(message: message ?? 'tidak ada data');
        }
      ),
    ], 
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home (go_router)")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text("ke Second Page (named route)"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                );
              },
              child: const Text("buka detail page (tanpa data)"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: 'Halo, ini data dari Home Page',
                );
              },
              child: const Text("buka detail page (kirim data)"),
            ),
          ],
        ),
      ),
    );
  }
}

