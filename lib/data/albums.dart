import 'package:weeeklyapp/model/album.dart';

List<Album> albumsData = [
  Album(
    title: 'We are',
    releaseDate: DateTime.utc(2020, 06, 30),
    imagePath: 'assets/images/cover_art/we_are.png',
    lyricsPaths: [
      'assets/lyrics/we_are/weeekly_day.json',
      'assets/lyrics/we_are/universe.json',
      'assets/lyrics/we_are/tag_me.json',
      'assets/lyrics/we_are/hello.json',
      'assets/lyrics/we_are/reality.json',
    ],
  ),
  Album(
    title: 'We can',
    releaseDate: DateTime.utc(2020, 10, 13),
    imagePath: 'assets/images/cover_art/we_can.png',
    lyricsPaths: [
      'assets/lyrics/we_can/unnie.json',
      'assets/lyrics/we_can/my_earth.json',
      'assets/lyrics/we_can/zig_zag.json',
      'assets/lyrics/we_can/top_secret.json',
      'assets/lyrics/we_can/weeekly.json',
    ],
  ),
  Album(
    title: 'We play',
    releaseDate: DateTime.utc(2021, 03, 17),
    imagePath: 'assets/images/cover_art/we_play.png',
    lyricsPaths: [
      'assets/lyrics/we_play/yummy.json',
      'assets/lyrics/we_play/lucky.json',
      'assets/lyrics/we_play/after_school.json',
      'assets/lyrics/we_play/uni.json',
      'assets/lyrics/we_play/butterfly_fairytale.json',
    ],
  ),
];
