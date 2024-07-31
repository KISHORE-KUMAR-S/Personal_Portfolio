enum JobType {
  fullTime,
  partTime,
  remote,
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
      startDate: DateTime(2023, 8),
      endDate: DateTime.now(),
      company: "Rurutek Private Limited",
      position: "Software Engineer",
      responsibilities: [
        "Started my journey as Mobile App Developer",
        "Closely collaborated with backend developer team to ensure secure and reliable API development",
      ],
    ),
  ];
}
