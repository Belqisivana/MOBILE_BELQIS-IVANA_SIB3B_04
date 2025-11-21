import 'package:flutter/material.dart';
import 'counter_notifier.dart';
import 'screen_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterNotifierProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value:",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: counter,
              builder: (_, __) {
                return Text(
                  counter.value.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DetailScreen()));
              },
              child: const Text("Go to Detail Screen"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
