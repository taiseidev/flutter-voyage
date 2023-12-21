import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseReducerSample extends HookWidget {
  const UseReducerSample({super.key});

  @override
  Widget build(BuildContext context) {
    final store = useReducer<State, CountAction>(
      reducer,
      initialState: State(),
      initialAction: NoAction(),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Count: ${store.state.counter}'),
            ElevatedButton(
              onPressed: () => store.dispatch(Increment()),
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () => store.dispatch(Decrement()),
              child: Text('Decrement'),
            ),
            ElevatedButton(
              onPressed: () => store.dispatch(Reset()),
              child: Text('Reset'),
            ),
            ElevatedButton(
              onPressed: () => store.dispatch(NoAction()),
              child: Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}

sealed class CountAction {}

class Increment extends CountAction {}

class Decrement extends CountAction {}

class Reset extends CountAction {}

class NoAction extends CountAction {}

State reducer(State state, CountAction action) => switch (action) {
      Increment() => State(counter: state.counter + 1),
      Decrement() => State(counter: state.counter - 1),
      Reset() => State(counter: 0),
      NoAction() => state,
    };

class State {
  State({this.counter = 0});
  final int counter;
}
