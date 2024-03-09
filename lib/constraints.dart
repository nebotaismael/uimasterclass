import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uimasterclass/countprovider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive UI Example'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return DesktopLayout();
          } else {
            return MobileLayout();
          }
        },
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Desktop Layout',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class MobileLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Center(
          child: Text(
            'Mobile Layout',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Text('${ref.watch(count)} Points'),
        ElevatedButton(
            onPressed: () {
              var newcount = ref.read(count.notifier);
              newcount.increment();
            },
            child: Text('Increment'))
      ],
    );
  }
}
