import 'package:flutter/material.dart';
import 'list_page.dart';
import 'form_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const ListPage(),
        '/form': (context) {
          final arg = ModalRoute.of(context)!.settings.arguments;
          if (arg is Map<String, dynamic>) return FormPage(user : arg); 
          return const FormPage();
        }
      },
    );
  } 
}