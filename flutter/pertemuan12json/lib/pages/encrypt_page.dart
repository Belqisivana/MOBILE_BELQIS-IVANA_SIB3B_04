import 'package:flutter/material.dart';
import '../services/encryption_service.dart';

class EncryptPage extends StatefulWidget {
  const EncryptPage({super.key});

  @override
  State<EncryptPage> createState() => _EncryptPageState();
}

class _EncryptPageState extends State<EncryptPage> {
  String _cipher = '';
  String _decrypted = '';

  void _enc() {
    final plain = '{"token":"abc123","user":"andi"}';
    final cipher = EncryptionService.encryptString(plain);
    setState(() {
      _cipher = cipher;
      _decrypted = '';
    });
  }

  void _dec() {
    if (_cipher.isEmpty) return;
    final dec = EncryptionService.decryptString(_cipher);
    setState(() {
      _decrypted = dec;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        ElevatedButton(onPressed: _enc, child: const Text('Encrypt contoh JSON')),
        ElevatedButton(onPressed: _dec, child: const Text('Decrypt')),
        const SizedBox(height: 12),
        const Text('Cipher (base64):'),
        SelectableText(_cipher),
        const SizedBox(height: 12),
        const Text('Decrypted:'),
        Text(_decrypted),
      ]),
    );
  }
}
