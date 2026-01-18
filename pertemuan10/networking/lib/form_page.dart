import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'user_service.dart';

class FormPage extends StatefulWidget {
  final Map<String, dynamic>? user;
  const FormPage({super.key, this.user});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final keyForm = GlobalKey<FormState>();

  late final TextEditingController ndepan;
  late final TextEditingController nbelakang;
  late final TextEditingController mail;
  late final TextEditingController usr;
  late final TextEditingController pwd;

  bool loading = false;
  File? pickedPhoto;

  bool get isEdit => widget.user != null;

  @override
  void initState() {
    super.initState();
    ndepan = TextEditingController(
      text: (widget.user?['nama_depan'] ?? '').toString(),
    );
    nbelakang = TextEditingController(
      text: (widget.user?['nama_belakang'] ?? '').toString(),
    );
    mail = TextEditingController(
      text: (widget.user?['email'] ?? '').toString(),
    );
    usr = TextEditingController(
      text: (widget.user?['username'] ?? '').toString(),
    );
    pwd = TextEditingController(text: '');
  }

  @override
  void dispose() {
    ndepan.dispose();
    nbelakang.dispose();
    mail.dispose();
    usr.dispose();
    pwd.dispose();
    super.dispose();
  }

  Future<void> pickPhoto() async {
    final picker = ImagePicker();
    final x = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (x == null) return;
    setState(() => pickedPhoto = File(x.path));
  }

  Future<void> submit() async {
    if (!keyForm.currentState!.validate()) return;

    if (!isEdit && pickedPhoto == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Foto wajib untuk insert')),
      );
      return;
    }

    setState(() => loading = true);

    try {
      await UserService.insup(
        id: isEdit ? widget.user!['id'].toString() : null,
        ndepan: ndepan.text.trim(),
        nbelakang: nbelakang.text.trim(),
        mail: mail.text.trim(),
        usr: usr.text.trim(),
        pwd: pwd.text.trim(),
        photoFile: pickedPhoto,
      );

      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Update' : 'Insert'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: keyForm,
          child: ListView(
            children: [
              TextButton.icon(
                onPressed: loading ? null : pickPhoto,
                icon: const Icon(Icons.image),
                label: Text(
                  pickedPhoto == null ? 'Pilih foto' : 'Foto dipilih',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: ndepan,
                decoration: const InputDecoration(labelText: 'Nama Depan'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Wajib' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nbelakang,
                decoration: const InputDecoration(labelText: 'Nama Belakang'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Wajib' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: mail,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Wajib' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: usr,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Wajib' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: pwd,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : submit,
                  child: loading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(isEdit ? 'UPDATE' : 'INSERT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
