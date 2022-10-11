import 'package:flutter/material.dart';

class ButtonAnimated extends StatefulWidget {
  const ButtonAnimated({super.key});

  @override
  State<ButtonAnimated> createState() => _ButtonAnimatedState();
}

class _ButtonAnimatedState extends State<ButtonAnimated> {
  var state = GeoState.circle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parquinho'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            setState(() {
              if (state.type == GeoType.circle) {
                state = GeoState.square();
              } else {
                state = GeoState.circle();
              }
            });
          });
        },
        child: AnimatedAlign(
          alignment: state.aliamento,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            margin: state.geo,
            alignment: state.aliamento,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: state.color,
              borderRadius: BorderRadius.circular(state.radius),
            ),
            height: state.heightSize,
            width: state.widthSize,
          ),
        ),
      ),
    );
  }
}

enum GeoType { square, circle }

class GeoState {
  final double heightSize;
  final double widthSize;
  final Color color;
  final double radius;
  final GeoType type;
  final Alignment aliamento;
  final EdgeInsets geo;

  GeoState({
    required this.heightSize,
    required this.widthSize,
    required this.color,
    required this.radius,
    required this.type,
    required this.aliamento,
    required this.geo,
  });

  factory GeoState.square() {
    return GeoState(
      heightSize: 50,
      widthSize: 100,
      color: Colors.red,
      radius: 0,
      type: GeoType.square,
      aliamento: Alignment.topCenter,
      geo: const EdgeInsets.fromLTRB(0, 50, 0, 0),
    );
  }

  factory GeoState.circle() {
    return GeoState(
      heightSize: 70,
      widthSize: 70,
      color: Colors.green,
      radius: 100,
      type: GeoType.circle,
      aliamento: Alignment.bottomRight,
      geo: const EdgeInsets.fromLTRB(0, 0, 20, 20),
    );
  }
}
