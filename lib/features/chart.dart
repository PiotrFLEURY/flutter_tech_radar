import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tech_radar/features/blip.dart';
import 'package:flutter_tech_radar/features/quadrant.dart';
import 'package:flutter_tech_radar/features/ring.dart';

class RadarChart extends StatelessWidget {
  const RadarChart({
    Key? key,
    required this.quadrants,
    required this.rings,
    required this.blips,
  }) : super(key: key);

  final List<RadarQuadrant> quadrants;
  final List<RadarRing> rings;
  final List<RadarBlip> blips;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        ...rings.reversed.map(
          (ring) => Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: ring,
            ),
          ),
        ),
        ...quadrants.map(
          (quadrant) => Positioned(
            top: quadrant.top,
            left: quadrant.left,
            child: quadrant,
          ),
        ),
        ...blips.map(
          (blip) {
            final group = blip.group;

            final blipQuadrant = quadrants
                .map((e) => e.label)
                .toList()
                .indexOf(group.first.quadrant);
            final blipRing =
                rings.map((e) => e.label).toList().indexOf(group.first.ring);

            // I want to display blips in the corresponding quadrant and ring
            // There is 4 quadrants and 4 rings

            // compute angle
            final angle = pi / 4 + pi / 2 + (pi / 2 * (blipQuadrant + 1));
            // compute distance from center
            final distance = ((quadrants.first.size / 4) * (blipRing + 1)) -
                (quadrants.first.size / 8);

            // compute x and y
            final x = distance * cos(angle);
            final y = distance * sin(angle);

            return Positioned(
              top: quadrants.first.size + y,
              left: quadrants.first.size + x,
              child: blip,
            );
          },
        ),
      ],
    );
  }
}
