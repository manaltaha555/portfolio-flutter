class EducationModel {
  final String title;
  final String body;
  final String date;
  final String location;
  final String image;
  final String? grade;
  final List<String>? details;

  EducationModel({
    required this.title,
    required this.body,
    required this.date,
    required this.location,
    required this.image,
    this.grade,
    this.details,
  });
}