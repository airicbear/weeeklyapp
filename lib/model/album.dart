class Album {
  final String title;
  final DateTime releaseDate;
  final String imagePath;
  final List<String> lyricsPaths;

  Album({
    required this.title,
    required this.releaseDate,
    required this.imagePath,
    required this.lyricsPaths,
  });
}
