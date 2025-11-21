import 'package:flutter/material.dart';

class CounterInherited extends InheritedWidget {
  final int initialValue;

  const CounterInherited({
    super.key,
    required super.child,
    this.initialValue = 0,
  });

  static CounterInherited of(BuildContext context) {
    final CounterInherited? result =
        context.dependOnInheritedWidgetOfExactType<CounterInherited>();
    assert(result != null, 'No CounterInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant CounterInherited oldWidget) {
    return initialValue != oldWidget.initialValue;
  }
}
