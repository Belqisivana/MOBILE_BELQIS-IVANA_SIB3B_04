import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/user.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List<User> _users = [];
  String _status = '';

  Future<void> _fetch() async {
    setState(() => _status = 'Loading...');
    try {
      final users = await ApiService.fetchUsers();
      setState(() {
        _users = users;
        _status = 'Selesai: ${users.length} users';
      });
    } catch (e) {
      setState(() => _status = 'Error: $e');
    }
  }

  Future<void> _fetchJson() async {
    setState(() => _status = 'Loading JSON arbitrary...');
    try {
      final j = await ApiService.fetchJson('https://pokeapi.co/api/v2/pokemon/ditto');
      setState(() => _status = 'Nama Pokemon: ${j['name']}');
    } catch (e) {
      setState(() => _status = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        ElevatedButton(onPressed: _fetch, child: const Text('Fetch Users (jsonplaceholder)')),
        ElevatedButton(onPressed: _fetchJson, child: const Text('Fetch PokeAPI (ditto)')),
        const SizedBox(height: 8),
        Text(_status),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (_, i) {
              final u = _users[i];
              return ListTile(
                title: Text(u.name),
                subtitle: Text(u.email ?? '-'),
                trailing: Text('age: ${u.age}'),
              );
            },
          ),
        ),
      ]),
    );
  }
}
