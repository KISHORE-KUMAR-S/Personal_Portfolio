class Education {
  final int start, end;
  final String almaMater, qualification, district, state, grade;

  Education({
    required this.start,
    required this.end,
    required this.almaMater,
    required this.district,
    required this.state,
    required this.qualification,
    required this.grade,
  });

  static final List<Education> ksExperiences = [
    Education(
      start: 2019,
      end: 2023,
      almaMater: "K.S. Rangasamy College of Technology",
      district: "Tiruchengode, Namakkal",
      state: "Tamil Nadu",
      qualification: "B.E. Computer Science and Engineering",
      grade: "8.71",
    ),
    Education(
      start: 2018,
      end: 2019,
      almaMater: "Holy Cross Matriculation Boys Higher Secondary School",
      district: "Salem",
      state: "Tamil Nadu",
      qualification: "HSC",
      grade: "71.67%",
    ),
    Education(
      start: 2016,
      end: 2017,
      almaMater: "Holy Cross Matriculation Boys Higher Secondary School",
      district: "Salem",
      state: "Tamil Nadu",
      qualification: "SSLC",
      grade: "86.8%",
    ),
  ];
}
