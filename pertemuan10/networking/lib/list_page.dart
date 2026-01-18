import 'package:flutter/material.dart';
import 'user_service.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<Map<String, dynamic>>> future;

  @override
  void initState() {
    super.initState();
    future = UserService.getUsers();
  }

  void reload() {
    setState(() {
      future = UserService.getUsers();
    });
  }

  Future<void> openAdd() async {
    final changed = await Navigator.pushNamed(context, '/form');
    if (changed == true) reload();
  }

  Future<void> openEdit(Map<String, dynamic> user) async {
    final changed = await Navigator.pushNamed(
      context,
      '/form',
      arguments: user,
    );
    if (changed == true) reload();
  }

  Future<void> doDelete(String id) async {
    try {
      await UserService.deleteUser(id);
      if (!mounted) return;
      reload();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD (Bio) + Photo Upload'),
        actions: [
          IconButton(
            onPressed: reload,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAdd,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(child: Text('Data kosong'));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) {
              final item = data[i];

              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(255, 255, 92, 92),
                  backgroundImage: item['photo'].isNotEmpty
                      ? NetworkImage(item['photo'])
                      : null,
                  child: item['photo'].isEmpty
                      ? const Icon(Icons.person, size: 40, color: Colors.grey)
                      : null,
                ),
                title: Text(
                  '${item['nama_depan']} ${item['nama_belakang']}',
                ),
                subtitle: Text(
                  '${item['email']} | ${item['username']}',
                ),
                onTap: () => openEdit(item),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      doDelete(item['id'].toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
