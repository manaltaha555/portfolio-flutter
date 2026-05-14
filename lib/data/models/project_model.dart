class ProjectModel {
  final DateTime startDate;
  final DateTime endDate;
  final List <String> imagePath;
  final String projectTitle;
  final String body;
  final List<String> skills;
  final String? githubLink;
  
  ProjectModel({
    required this.endDate,
    required this.startDate,
    required this.imagePath,
    required this.projectTitle,
    required this.body,
    required this.skills,
    this.githubLink,
  });
}
