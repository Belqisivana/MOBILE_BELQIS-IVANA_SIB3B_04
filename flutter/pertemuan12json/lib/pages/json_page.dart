import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/user.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({super.key});
  @override
  State<JsonPage> createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  String _output = '';

  // contoh JSON yang tidak kompatibel (age string, user_name vs name, nested)
  final _sampleJson = '''
  {
    "id": 1,
    "user_name": "Luqman",
    "age": "21",
    "email": "luqman@example.com",
    "address": {"city": "Malang", "street": "Jl. Contoh"}
  }
  ''';

  void _convert() {
    try {
      final map = jsonDecode(_sampleJson) as Map<String, dynamic>;
      final user = User.fromJson(map);
      setState(() {
        _output = 'Dari JSON -> User object:\\n${user.toJson()}';
      });
    } catch (e) {
      setState(() => _output = 'Error konversi: $e');
    }
  }

  void _toJson() {
    final user = User(
      id: 2,
      name: 'Budi',
      age: 30,
      email: 'budi@example.com',
      address: Address(city: 'Jakarta', street: 'Jl. Merdeka'),
    );
    setState(() => _output = jsonEncode(user.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Contoh JSON tidak kompatibel -> konversi aman'),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: _convert, child: const Text('Parse JSON')),
          ElevatedButton(onPressed: _toJson, child: const Text('User -> JSON')),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(child: Text(_output)),
          ),
        ],
      ),
    );
  }
}
