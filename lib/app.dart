import 'package:flutter/material.dart';
import 'package:flutter_tech_radar/data/models/blip.dart';
import 'package:flutter_tech_radar/features/radar.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.blips,
  });

  final List<Blip> blips;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Radar(
        blips: blips,
      ),
    );
  }
}
