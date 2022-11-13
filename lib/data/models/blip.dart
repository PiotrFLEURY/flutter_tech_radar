class Blip {
  const Blip({
    required this.label,
    required this.quadrant,
    required this.ring,
  });

  final String label;
  final String quadrant;
  final String ring;

  // from json
  factory Blip.fromJson(String quadrant, Map<String, dynamic> json) => Blip(
        label: json['label'],
        quadrant: quadrant,
        ring: json['ring'],
      );
}
