import 'package:flutter/material.dart';
import 'counter_inherited.dart';
import 'counter_notifier.dart';
import 'screen_home.dart';

void main() {
  runApp(
    // Gunakan InheritedNotifier agar state otomatis update
    CounterNotifierProvider(
      notifier: CounterNotifier(),
      child: const CounterInherited(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
