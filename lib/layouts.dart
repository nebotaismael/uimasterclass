import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:uimasterclass/gesture.dart';
import 'package:uimasterclass/orientation.dart';
import 'package:uimasterclass/widget.dart';

class LayOuts extends StatefulWidget {
  @override
  State<LayOuts> createState() => _LayOutsState();
}

class _LayOutsState extends State<LayOuts> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  SpringSimulation simulation = SpringSimulation(
    SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0),
    0,
    2,
    1,
  );

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);
    controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Layout Example'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCustomWidget(),
              orientaTion(),
              const Text('Welcome to the Layout Example!'),
              const SizedBox(height: 20),
              AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    double width = MediaQuery.of(context).size.width;
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          color: Colors.yellow,
                          width: width * 0.8,
                          height: animation.value * 200,
                        ),
                        const Text(
                          'Hello, Flutter!',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                  Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Button pressed action
                  print("Hello");
                },
                child: const Text('Submit'),
              ),
              GestureDetector(
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  // Handle horizontal drag update event\
                  print('Draged');
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  // Handle vertical drag end event
                  print('Draged');
                },
                onTap: () {
                  print('Tapped');
                },
                child: const Text('tap Me'),
              ),
              Gesture()
            ],
          ),
        ),
      ),
    );
  }
}
