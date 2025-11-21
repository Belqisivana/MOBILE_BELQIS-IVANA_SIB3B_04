import 'package:flutter/material.dart';
import 'json_page.dart';
import 'prefs_page.dart';
import 'file_page.dart';
import 'encrypt_page.dart';
import 'api_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _idx = 0;
  final _pages = const [
    JsonPage(),
    PrefsPage(),
    FilePage(),
    EncryptPage(),
    ApiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter JSON & Storage Demo')),
      body: _pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: (v) => setState(() => _idx = v),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'JSON'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Prefs'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Files'),
          BottomNavigationBarItem(icon: Icon(Icons.lock), label: 'Encrypt'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'API'),
        ],
      ),
    );
  }
}
