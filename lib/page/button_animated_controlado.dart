import 'package:flutter/material.dart';

class ButtonControlado extends StatefulWidget {
  const ButtonControlado({super.key});

  @override
  State<ButtonControlado> createState() => _ButtonControladoState();
}

class _ButtonControladoState extends State<ButtonControlado>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Color?> colorAnimation;
  late final Animation<double> heightSizeAnimation;
  late final Animation<double> widthSizeAnimation;
  late final Animation<double> radiusAnimation;
  late final Animation<Alignment> aliamentoAnimation;
  late final Animation<EdgeInsets> marginAnimation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    colorAnimation = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(controller);

    heightSizeAnimation = Tween(
      begin: 70.0,
      end: 50.0,
    ).animate(controller);

    widthSizeAnimation = Tween(
      begin: 70.0,
      end: 100.0,
    ).animate(controller);

    radiusAnimation = Tween(
      begin: 100.0,
      end: 0.0,
    ).animate(controller);

    aliamentoAnimation = Tween(
      begin: Alignment.bottomRight,
      end: Alignment.topCenter,
    ).animate(controller);

    marginAnimation = Tween(
      begin: const EdgeInsets.fromLTRB(0, 0, 20, 20),
      end: const EdgeInsets.fromLTRB(0, 50, 0, 0),
    ).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  bool ontap = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parquinho'),
      ),
      body: GestureDetector(
        onTap: () {
          ontap = !ontap;
          if (ontap) {
            controller.forward();
          } else {
            controller.reverse();
          }
        },
        child: Align(
          alignment: aliamentoAnimation.value,
          child: Container(
            margin: marginAnimation.value,
            decoration: BoxDecoration(
              color: colorAnimation.value,
              borderRadius: BorderRadius.circular(radiusAnimation.value),
            ),
            height: heightSizeAnimation.value,
            width: widthSizeAnimation.value,
          ),
        ),
      ),
    );
  }
}
