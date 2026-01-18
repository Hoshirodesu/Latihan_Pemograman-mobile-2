import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contoh stack sederhana")),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.blue,
          ),
          Text(
            'Stack example',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Icon(
              Icons.picture_as_pdf, 
              size: 32, 
              color: Colors.amber[300]
              ),
          ),
        ],
      ),
    );
  }
}