import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/storage_service.dart';

class PrefsPage extends StatefulWidget {
  const PrefsPage({super.key});

  @override
  State<PrefsPage> createState() => _PrefsPageState();
}

class _PrefsPageState extends State<PrefsPage> {
  String _status = 'Belum ada aksi';

  Future<void> _save() async {
    final user = User(
      id: 10,
      name: 'Siti',
      age: 28,
      email: 'siti@example.com',
      address: Address(city: 'Surabaya', street: null),
    );
    final ok = await StorageService.saveUser(user);
    setState(() => _status = ok ? 'User tersimpan' : 'Gagal simpan');
  }

  Future<void> _load() async {
    final u = await StorageService.loadUser();
    setState(() => _status = u == null ? 'Tidak ada user' : 'User: ${u.toJson()}');
  }

  Future<void> _clear() async {
    final ok = await StorageService.clearUser();
    setState(() => _status = ok ? 'Dihapus' : 'Gagal hapus');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(onPressed: _save, child: const Text('Simpan ke SharedPreferences')),
          ElevatedButton(onPressed: _load, child: const Text('Load dari SharedPreferences')),
          ElevatedButton(onPressed: _clear, child: const Text('Hapus dari SharedPreferences')),
          const SizedBox(height: 16),
          Text(_status),
        ],
      ),
    );
  }
}
