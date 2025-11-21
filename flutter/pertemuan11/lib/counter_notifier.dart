import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}

class CounterNotifierProvider extends InheritedNotifier<CounterNotifier> {
  const CounterNotifierProvider({
    super.key,
    required CounterNotifier notifier,
    required Widget child,
  }) : super(notifier: notifier, child: child);

  static CounterNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterNotifierProvider>()!
        .notifier!;
  }
}
