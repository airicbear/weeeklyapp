import 'package:flutter/material.dart';

class Member {
  final String stageName;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final String imagePath;

  Member({
    @required this.stageName,
    @required this.firstName,
    @required this.lastName,
    @required this.birthday,
    @required this.imagePath,
  });

  String get fullName => '${this.firstName} ${this.lastName}';

  static final List<Member> members = [
    Member(
      stageName: "Soojin",
      firstName: "Lee",
      lastName: "Soojin",
      birthday: DateTime.utc(2001, 12, 12),
      imagePath: "assets/images/members/we-can/lee-soojin.jpg",
    ),
    Member(
      stageName: "Jiyoon",
      firstName: "Shin",
      lastName: "Jiyoon",
      birthday: DateTime.utc(2002, 05, 10),
      imagePath: "assets/images/members/we-can/shin-jiyoon.jpg",
    ),
    Member(
      stageName: "Monday",
      firstName: "Kim",
      lastName: "Jimin",
      birthday: DateTime.utc(2002, 03, 02),
      imagePath: "assets/images/members/we-can/monday.jpg",
    ),
    Member(
      stageName: "Soeun",
      firstName: "Park",
      lastName: "Soeun",
      birthday: DateTime.utc(2002, 10, 26),
      imagePath: "assets/images/members/we-can/park-soeun.jpg",
    ),
    Member(
      stageName: "Jaehee",
      firstName: "Lee",
      lastName: "Jaehee",
      birthday: DateTime.utc(2004, 03, 18),
      imagePath: "assets/images/members/we-can/lee-jaehee.jpg",
    ),
    Member(
      stageName: "Jihan",
      firstName: "Han",
      lastName: "Jihyo",
      birthday: DateTime.utc(2004, 06, 12),
      imagePath: "assets/images/members/we-can/jihan.jpg",
    ),
    Member(
      stageName: "Zoa",
      firstName: "Cho",
      lastName: "Hyewon",
      birthday: DateTime.utc(2005, 05, 31),
      imagePath: "assets/images/members/we-can/zoa.jpg",
    ),
  ];
}
