import 'package:flutter/material.dart' show AssetImage;

enum JobType {
  fullTime,
  partTime,
  remote,
  intern,
}

class Experience {
  final DateTime startDate, endDate;
  final String company, position;
  final JobType type;
  final List<String> responsibilities;
  final AssetImage image;

  Experience({
    required this.startDate,
    required this.endDate,
    required this.company,
    required this.position,
    this.type = JobType.fullTime,
    required this.responsibilities,
    required this.image,
  });

  static final List<Experience> ksExperiences = [
    Experience(
      startDate: DateTime(2023, 8),
      endDate: DateTime.now(),
      company: "Rurutek Private Limited",
      position: "Software Engineer",
      type: JobType.intern,
      responsibilities: [
        "Started my journey as Mobile App Developer",
        "Started learning Jetpack Compose (Android) and Flutter",
        "Collaborated with Senior Developers",
        "Build intuitive, engaging and progressive User Interactions for Mobile Apps",
        "Fixed bugs and performance problems"
      ],
      image: const AssetImage("assets/rurutek_logo.png"),
    ),
  ];
}
