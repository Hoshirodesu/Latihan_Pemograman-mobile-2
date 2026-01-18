import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Container Column row')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text('Container',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(
                    3, 
                    (i) => Padding(padding: const EdgeInsets.all(4),
                    child: Text('Column item ${i + 1}'),
                    )
                  ),
                ),
                const SizedBox(),
                Row()],
            ),
          ),
        ),
      ),
    );
  }
}
