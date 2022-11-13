import 'package:flutter/material.dart';

class RadarQuadrant extends StatelessWidget {
  const RadarQuadrant({
    Key? key,
    required this.label,
    required this.size,
    required this.alignment,
  }) : super(key: key);

  final String label;
  final double size;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(border: border),
      child: Align(
        alignment: alignment,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w800,
            color: Colors.brown[700],
          ),
        ),
      ),
    );
  }

  double get top =>
      alignment == Alignment.topLeft || alignment == Alignment.topRight
          ? 0.0
          : size;

  double get left =>
      alignment == Alignment.topLeft || alignment == Alignment.bottomLeft
          ? 0.0
          : size;

  Border get border => Border(
        bottom:
            alignment == Alignment.topLeft || alignment == Alignment.topRight
                ? BorderSide(
                    color: Colors.grey[200]!,
                    width: 2,
                  )
                : BorderSide.none,
        top: alignment == Alignment.bottomLeft ||
                alignment == Alignment.bottomRight
            ? BorderSide(
                color: Colors.grey[200]!,
                width: 2,
              )
            : BorderSide.none,
        right:
            alignment == Alignment.topLeft || alignment == Alignment.bottomLeft
                ? BorderSide(
                    color: Colors.grey[200]!,
                    width: 2,
                  )
                : BorderSide.none,
        left: alignment == Alignment.topRight ||
                alignment == Alignment.bottomRight
            ? BorderSide(
                color: Colors.grey[200]!,
                width: 2,
              )
            : BorderSide.none,
      );
}
