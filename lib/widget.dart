import 'package:flutter/material.dart';

class MyCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildContent(),
    );
  }

  Widget buildContent() {
    return Row(
      children: [
        Icon(Icons.person),
        Text('John Doe'),
      ],
    );
  }
}
