import 'package:flutter/material.dart';

void main() {
  runApp(const PraktikWidget());
}

class PraktikWidget extends StatelessWidget {
  const PraktikWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // biar banner debug hilang
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ini AppBar"),
          backgroundColor: Colors.blue,
          leading: const Icon(Icons.menu), // ikon di kiri
          actions: const [
            Icon(Icons.search), // ikon di kanan
            Icon(Icons.more_vert),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Halo Flutter",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text("Baris 1"),
              const Text("Baris 2"),
              const Text("Baris 3"),
              const SizedBox(height: 20), // spasi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home, size: 40, color: Colors.blue),
                  Icon(Icons.star, size: 40, color: Colors.orange),
                  Icon(Icons.settings, size: 40, color: Colors.green),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: const [
                  Text("Atas"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.red, size: 40),
                      Icon(Icons.star, color: Colors.green, size: 40),
                      Icon(Icons.star, color: Colors.blue, size: 40),
                    ],
                  ),
                  Text("Bawah"),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: 200,
                height: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.pink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Text("Gradient Container",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 200,
                height: 100,
                color: Colors.orange,
                alignment: Alignment.bottomRight,
                child: const Text("Sudut kanan bawah"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("Elevated Button ditekan!");
                },
                child: const Text("Elevated Button"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  print("Text Button ditekan!");
                },
                child: const Text("Text Button"),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  print("Outlined Button ditekan!");
                },
                child: const Text("Outlined Button"),
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  print("Icon Button ditekan!");
                },
              ),
              const SizedBox(height: 10),
              const FlutterLogo(
                size: 100,
                style: FlutterLogoStyle.horizontal,
                textColor: Colors.blue,
              ),
              const SizedBox(height: 10),
              const Icon(
                Icons.home,
                size: 50,
                color: Colors.blue,
              ),
              const SizedBox(height: 10),
              Image.network(
                "https://flutter.dev/images/flutter-logo-sharing.png",
                width: 150,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Floating Action Button ditekan!");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}