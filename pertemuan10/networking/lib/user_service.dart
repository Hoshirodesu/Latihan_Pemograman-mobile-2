import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'api.dart';

class UserService {
  static final Dio dio = Dio(
    BaseOptions(
      responseType: ResponseType.plain,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    ),
  );

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final res = await dio.get(Api.get);
    final raw = (res.data ?? '').toString().trim();
    final decoded = jsonDecode(raw);
    if (decoded is !List) throw Exception('Response bukan List JSON');
      return decoded.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  static Future<String> deleteUser(String id) async {
    final res = await dio.post(Api.delete, data: FormData.fromMap({'id': id}));
    return (res.data ?? '').toString();
  }

  static Future<String> insup({
    String? id,
    required String ndepan,
    required String nbelakang,
    required String mail,
    required String usr,
    required String pwd,
    File? photoFile,
  }) async {
    final map = <String, dynamic>{
      'ndepan': ndepan,
      'nbelakang': nbelakang,
      'mail': mail,
      'usr': usr,
      'pwd': pwd,
    };
    if (id != null) map['id'] = id;
    if (pwd.trim().isNotEmpty) {
      map['pwd'] = pwd;
    }

      if (photoFile != null) {
        map['filePhoto'] = await MultipartFile.fromFile(
          photoFile.path,
          filename: photoFile.uri.pathSegments.isNotEmpty
              ? photoFile.uri.pathSegments.last
              : 'photo.jpg',
        );
      }

      final res = await dio.post(Api.insup, data: FormData.fromMap(map));
      return (res.data ?? '').toString();
  }
}