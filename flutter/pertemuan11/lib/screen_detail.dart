import 'package:flutter/material.dart';
import 'counter_notifier.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterNotifierProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Screen")),
      body: Center(
        child: AnimatedBuilder(
          animation: counter,
          builder: (_, __) {
            return Text(
              "Current value: ${counter.value}",
              style: const TextStyle(fontSize: 35),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: counter.decrement,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: counter.increment,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
