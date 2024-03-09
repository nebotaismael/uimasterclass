import 'dart:async';

import 'package:flutter/material.dart';

class CounterBloc {
  final _counter = 0; // Initial counter value
  final _counterController =
      StreamController<int>.broadcast(); // Broadcast stream

  Stream<int> get counterStream => _counterController.stream;

  void incrementCounter() {
    _counterController.sink.add(_counter + 1);
  }

  void dispose() {
    _counterController.close();
  }
}

final counterBloc = CounterBloc(); // Singleton instance

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counterBloc.counterStream,
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Waiting for counter...');
          default:
            return Text('Counter: ${snapshot.data}');
        }
      },
    );
  }
}
