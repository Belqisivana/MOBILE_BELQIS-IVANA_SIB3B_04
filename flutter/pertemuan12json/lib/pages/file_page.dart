import 'package:flutter/material.dart';
import '../services/file_service.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  String _status = '';

  Future<void> _write() async {
    final content = '{"message":"Hello from Flutter file", "time": "${DateTime.now().toIso8601String()}"}';
    final f = await FileService.writeString('sample.json', content);
    setState(() => _status = 'Tersimpan di ${f.path}');
  }

  Future<void> _read() async {
    final content = await FileService.readString('sample.json');
    setState(() => _status = content ?? 'File tidak ditemukan');
  }

  Future<void> _delete() async {
    final ok = await FileService.deleteFile('sample.json');
    setState(() => _status = ok ? 'File dihapus' : 'Gagal hapus');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        ElevatedButton(onPressed: _write, child: const Text('Tulis sample.json')),
        ElevatedButton(onPressed: _read, child: const Text('Baca sample.json')),
        ElevatedButton(onPressed: _delete, child: const Text('Hapus sample.json')),
        const SizedBox(height: 12),
        Expanded(child: SingleChildScrollView(child: Text(_status))),
      ]),
    );
  }
}
