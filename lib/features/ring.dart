import 'package:flutter/material.dart';

class RadarRing extends StatelessWidget {
  const RadarRing({
    Key? key,
    required this.label,
    required this.color,
    required this.size,
  }) : super(key: key);

  final String label;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size),
            border: Border.all(
              color: color,
              width: size * 0.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
