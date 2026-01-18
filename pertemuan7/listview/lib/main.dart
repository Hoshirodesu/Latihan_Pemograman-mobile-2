import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'models/news_item.dart';
import 'package:listview/grid.dart';
import 'package:listview/stack.dart';
import 'package:listview/custom_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<NewsItem> ListLatihan = [
    NewsItem(id: "1", title: "title 1", subtitle: "subtitle 1"),
    NewsItem(id: "2", title: "title 2", subtitle: "subtitle 2")
  ];

  void onClick(String getId) {
    Fluttertoast.showToast(
      msg: "Item clicked: $getId",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        // handle list view tap
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => StackPage()));
      break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => GridViewPage()));
      break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CustomWidgetPage()));
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan Listview.builder')),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: ListLatihan.length,
        itemBuilder: (context, index) {
          final latihan = ListLatihan[index];
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            color: Colors.green,
            child: ListTile(
              leading: Icon(Icons.picture_as_pdf, color: Colors.red),
              tileColor: Colors.blue[100],
              title: Text(latihan.title),
              subtitle: Text(latihan.subtitle),
              trailing: IconButton(
                icon: const Icon(Icons.info, color: Colors.blue), 
                onPressed: () => onClick(latihan.id), 
                color: Colors.black
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list, color: Color(0xFF000000)), 
          label: 'ListView'),
        BottomNavigationBarItem(
          icon: Icon(Icons.layers, color: Color(0xFF000000)), 
          label: 'Stack'),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view, color: Color(0xFF000000)), 
          label: 'GridView'),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets, color: Color(0xFF000000)), 
          label: 'Custom Widget'),
      ], 
      onTap: _onItemTapped,
      ),
    );
  }
}
