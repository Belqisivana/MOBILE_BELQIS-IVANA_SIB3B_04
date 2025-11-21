import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const _base = 'https://jsonplaceholder.typicode.com';

  // Ambil daftar users (demo)
  static Future<List<User>> fetchUsers() async {
    final resp = await http.get(Uri.parse('$_base/users'));
    if (resp.statusCode != 200) {
      throw Exception('Gagal fetch users: ${resp.statusCode}');
    }
    final List<dynamic> data = jsonDecode(resp.body);
    // jsonplaceholder users structure different => we'll map to our User minimal
    return data.map((e) {
      return User(
        id: e['id'] ?? 0,
        name: e['name'] ?? 'No name',
        age: 0, // API tidak kirim age — demo saja
        email: e['email'],
        address: e['address'] != null
            ? Address(
                city: e['address']['city']?.toString(),
                street: e['address']['street']?.toString(),
              )
            : null,
      );
    }).toList();
  }

  // Contoh fetch single JSON arbitrary (pokeapi, json placeholder, dll.)
  static Future<Map<String, dynamic>> fetchJson(String url) async {
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode != 200) {
      throw Exception('Request gagal: ${resp.statusCode}');
    }
    return jsonDecode(resp.body) as Map<String, dynamic>;
  }

  // Contoh POST (submit)
  static Future<Map<String, dynamic>> postJson(String url, Map body) async {
    final resp = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body));
    if (resp.statusCode >= 400) {
      throw Exception('POST gagal: ${resp.statusCode}');
    }
    return jsonDecode(resp.body) as Map<String, dynamic>;
  }
}
