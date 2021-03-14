class Member {
  final String stageName;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final String imagePath;

  Member({
    this.stageName,
    this.firstName,
    this.lastName,
    this.birthday,
    this.imagePath,
  });

  String get fullName => '${this.firstName} ${this.lastName}';
}
