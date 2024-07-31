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

  Experience({
    required this.startDate,
    required this.endDate,
    required this.company,
    required this.position,
    this.type = JobType.fullTime,
    required this.responsibilities,
  });

  static final List<Experience> ksExperiences = [
    Experience(
      startDate: DateTime(2024, 3),
      endDate: DateTime.now(),
      company: "Rurutek Private Limited",
      position: "Software Engineer",
      responsibilities: [
        "Started my journey as Mobile App Developer",
        "Worked closely with UI/UX Designers & Backend Developers",
      ],
    ),
    Experience(
      startDate: DateTime(2023, 8),
      endDate: DateTime(2024, 2),
      company: "Rurutek Private Limited",
      position: "Software Engineer",
      type: JobType.intern,
      responsibilities: [
        "Started my journey as Mobile App Developer Intern",
        "Started learning Jetpack Compose (Android) and Flutter",
      ],
    ),
  ];
}
