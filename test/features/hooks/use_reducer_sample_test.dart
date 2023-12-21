import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_voyage/features/hooks/use_reducer_sample.dart';

void main() {
  group('Reducer Tests', () {
    test('Increment action increases counter', () {
      final initialState = State(counter: 0);
      final newState = reducer(initialState, Increment());

      expect(newState.counter, 1);
    });

    test('Decrement action decreases counter', () {
      final initialState = State(counter: 0);
      final newState = reducer(initialState, Decrement());

      expect(newState.counter, -1);
    });

    test('Reset action resets counter', () {
      final initialState = State(counter: 5);
      final newState = reducer(initialState, Reset());

      expect(newState.counter, 0);
    });

    test('NoAction does not change counter', () {
      final initialState = State(counter: 3);
      final newState = reducer(initialState, NoAction());

      expect(newState.counter, 3);
    });
  });
}
