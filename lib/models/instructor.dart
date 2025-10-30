// models/instructor.dart
class Instructor {
  final String name;
  final String title;
  final String phone;
  final String email;
  final String office;
  final String imageUrl;

  Instructor({
    required this.name,
    required this.title,
    required this.phone,
    required this.email,
    required this.office,
    this.imageUrl = '',
  });
}