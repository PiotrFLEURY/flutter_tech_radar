import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tech_radar/data/models/blip.dart';

class RadarBlip extends StatelessWidget {
  const RadarBlip({
    Key? key,
    required this.group,
    required this.size,
  }) : super(key: key);

  static const defaultSize = 4.0;
  final List<Blip> group;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(2, sqrt(group.length)).toInt(),
          ),
          itemCount: group.length,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final blip = group[index];
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Tooltip(
                message: blip.label,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      size,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
