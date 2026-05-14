class FormModel {
  final String name;
  final String email;
  final String message;

  FormModel({
    required this.name,
    required this.email,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "message": message,
    };
  }
}