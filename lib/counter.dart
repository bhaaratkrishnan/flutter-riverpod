import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


part 'counter.g.dart';

@riverpod 
class Counter extends _$Counter {
  // Notifier 
  @override
  int build() => 0;

  void increment() => state++;

  void decrement() => state--;

  void logger() {
    print("Hello world");
  }
}