class Member {
  final String stageName;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final String imagePath;

  Member({
    required this.stageName,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.imagePath,
  });

  String get fullName => '${this.firstName} ${this.lastName}';
}
