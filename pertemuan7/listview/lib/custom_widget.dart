import 'package:flutter/material.dart';

class CustomWidgetPage extends StatelessWidget {
  const CustomWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Widget")),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          InfoCard(
            icon: Icons.person,
            title: "Judul ke 1",
            subtitle: "Subtitle ke 1",
            color: Colors.teal,
          ),
          SizedBox(height: 10),
          InfoCard(
            icon: Icons.headphones,
            title: "Judul ke 2",
            subtitle: "subtitle ke 2",
            color: Colors.red,
          ),
          SizedBox(height: 10),
          InfoCard(
            icon: Icons.animation_rounded,
            title: "Judul ke 3",
            subtitle: "Judul subtitle 3",
            color: Colors.blue,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(10),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          SizedBox(width: 10),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, 
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                  ),
                ),
              Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ],
          )
        ),
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
              ).showSnackBar(SnackBar(content: Text("Hapus $title")));
          }, 
          icon: Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}