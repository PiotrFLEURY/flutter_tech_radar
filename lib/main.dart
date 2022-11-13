import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tech_radar/app.dart';
import 'package:flutter_tech_radar/data/models/blips.dart';
import 'package:flutter_tech_radar/features/radar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tools = await rootBundle.loadString('assets/tools.json');
  final languages = await rootBundle.loadString('assets/languages.json');
  final platforms = await rootBundle.loadString('assets/platforms.json');
  final techniques = await rootBundle.loadString('assets/techniques.json');
  final blips = [
    ...Blips.fromJson(Radar.tools, jsonDecode(tools)).blips,
    ...Blips.fromJson(Radar.languages, jsonDecode(languages)).blips,
    ...Blips.fromJson(Radar.platforms, jsonDecode(platforms)).blips,
    ...Blips.fromJson(Radar.techniques, jsonDecode(techniques)).blips,
  ];
  runApp(MyApp(
    blips: blips,
  ));
}
