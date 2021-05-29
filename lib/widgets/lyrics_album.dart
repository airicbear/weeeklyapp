import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weeeklyapp/model/album.dart';
import 'package:weeeklyapp/model/song.dart';
import 'package:weeeklyapp/widgets/lyrics_song.dart';
import 'package:weeeklyapp/widgets/main_appbar.dart';
import 'package:weeeklyapp/widgets/missing_lyrics.dart';
import 'package:weeeklyapp/widgets/page_transition.dart';

class AlbumPage extends StatelessWidget {
  final Album album;

  const AlbumPage({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MainAppBar(
            imagePath: album.imagePath,
            title: album.title,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (album.lyricsPaths.length == 0) {
                  return MissingLyrics();
                }
                return FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString(
                    album.lyricsPaths.elementAt(index),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final song =
                          Song.fromJson(jsonDecode(snapshot.data.toString()));
                      return Card(
                        child: InkWell(
                          child: ListTile(
                            minVerticalPadding: 24.0,
                            title: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: '${index + 1}.  ${song.title}'),
                                  TextSpan(
                                    text:
                                        '${song.lyrics.allLyrics.isEmpty ? " (Unreleased)" : ""}',
                                    style: TextStyle(
                                      color: Theme.of(context).disabledColor,
                                    ),
                                  ),
                                ],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            if (song.lyrics.allLyrics.isNotEmpty) {
                              Navigator.of(context).push(
                                PageTransition.to(
                                  LyricsPage(
                                    song: song,
                                    imagePath: album.imagePath,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              },
              childCount:
                  album.lyricsPaths.length == 0 ? 1 : album.lyricsPaths.length,
            ),
          )
        ],
      ),
    );
  }
}
