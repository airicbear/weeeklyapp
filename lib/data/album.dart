import 'package:weeeklyapp/data/song.dart';

class Album {
  final List<Song> songs;
  final DateTime releaseDate;
  final String description;

  Album({this.songs, this.releaseDate, this.description});
}
