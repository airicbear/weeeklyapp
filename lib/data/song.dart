import 'package:weeeklyapp/data/lyrics.dart';

class Song {
  final String title;
  final Duration duration;
  final Lyrics lyrics;
  final String description;

  Song({this.title, this.duration, this.lyrics, this.description});
}
