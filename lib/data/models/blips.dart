import 'package:flutter_tech_radar/data/models/blip.dart';

class Blips {
  final List<Blip> blips;

  const Blips({
    required this.blips,
  });

  factory Blips.fromJson(String quadrant, List<dynamic> parsedJson) {
    return Blips(
        blips: parsedJson
            .map(
              (i) => Blip.fromJson(quadrant, i),
            )
            .toList());
  }
}
