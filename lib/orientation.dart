import 'package:flutter/material.dart';

Widget orientaTion() {
  return OrientationBuilder(
    builder: (context, orientation) {
      return Text('Current Orientation: $orientation');
    },
  );
}
