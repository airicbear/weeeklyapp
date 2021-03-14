import 'package:weeeklyapp/model/lyrics.dart';

class Song {
  final String title;
  final Lyrics lyrics;

  Song({this.title, this.lyrics});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'] as String,
      lyrics: Lyrics(
        allLyrics: json['lyrics'],
      ),
    );
  }
}
