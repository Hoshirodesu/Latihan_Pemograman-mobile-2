import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView")),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.all(8),
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text('Grid ke 1'),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('Grid ke 2'),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Grid ke 3'),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Grid ke 4'),
            ),
          ],
        ),
      ),
    );
  }
}