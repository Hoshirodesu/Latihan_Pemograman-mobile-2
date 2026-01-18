import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() =>  _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 1;
  void tekantombol() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Latihan stateful widget",
      home: Scaffold(
        appBar: AppBar(title: const Text("Latihan stateful widget")),
        body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("0"),
              MaterialButton(
                onPressed: tekantombol,
                color: Colors.blue,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text("Tambah")),
            ],
          ),
        ),
      ),
    );
  }
}
