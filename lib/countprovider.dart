import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountNotifier extends StateNotifier {
  CountNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 0) {
      state--;
    }
  }
}

final count = StateNotifierProvider((ref) => CountNotifier());
