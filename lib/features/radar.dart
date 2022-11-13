// A tech radar view diplaying splits by quadrant and rings by ring.

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_radar/data/models/blip.dart';
import 'package:flutter_tech_radar/features/blip.dart';
import 'package:flutter_tech_radar/features/chart.dart';
import 'package:flutter_tech_radar/features/quadrant.dart';
import 'package:flutter_tech_radar/features/ring.dart';

final ringColors = [
  Colors.green[800], // Adtop
  Colors.green[600], // Trial
  Colors.green[400], // Assess
  Colors.green[200], // Hold
];
const rings = [
  'Adopt',
  'Trial',
  'Assess',
  'Hold',
];
const quadrants = [
  Radar.tools,
  Radar.techniques,
  Radar.languages,
  Radar.platforms,
];
const quadrantsAlignments = [
  Alignment.topLeft,
  Alignment.topRight,
  Alignment.bottomRight,
  Alignment.bottomLeft,
];

class Radar extends StatelessWidget {
  const Radar({
    Key? key,
    required this.blips,
  }) : super(key: key);

  final List<Blip> blips;

  static const tools = 'Tools';
  static const techniques = 'Techniques';
  static const platforms = 'Platforms';
  static const languages = 'Languages & Frameworks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RadarView(
        blips: blips,
      ),
    );
  }
}

class RadarView extends StatelessWidget {
  const RadarView({
    super.key,
    required this.blips,
  });

  final List<Blip> blips;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest.shortestSide;
        return Center(
          child: SizedBox(
            width: size,
            height: size,
            child: RadarChart(
              rings: rings.map((ring) {
                final ratio = (size * 0.25) * (rings.indexOf(ring) + 1);
                return RadarRing(
                  label: ring,
                  color: ringColors[rings.indexOf(ring)]!,
                  size: ratio,
                );
              }).toList(),
              quadrants: quadrants.map((quadrant) {
                return RadarQuadrant(
                  label: quadrant,
                  size: size / 2,
                  alignment: quadrantsAlignments[quadrants.indexOf(quadrant)],
                );
              }).toList(),
              blips: groupBy(blips, (blip) => '${blip.quadrant}#${blip.ring}')
                  .values
                  .map((group) {
                return RadarBlip(
                  group: group,
                  size: size / 24,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
