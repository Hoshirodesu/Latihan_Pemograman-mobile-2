import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Page")),
      body: Center(
        child: Text(
          argument ?? 'Tidak ada data yang dikirim.',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}