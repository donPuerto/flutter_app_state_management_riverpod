import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterDemo extends StateNotifier<int> {
  CounterDemo() : super(0);
  // ignore: empty_constructor_bodies
  void increment() {
    state++;
  }
}
