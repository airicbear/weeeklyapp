import 'package:flutter/material.dart';
import 'package:weeeklyapp/model/album.dart';
import 'package:weeeklyapp/widgets/lyrics_album.dart';
import 'package:weeeklyapp/widgets/grid_card.dart';
import 'package:weeeklyapp/widgets/main_appbar.dart';

class Lyrics extends StatelessWidget {
  final List<Album> albums;

  const Lyrics({Key key, this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MainAppBar(
            imagePath: 'assets/images/home_buttons/lyrics.jpg',
            title: 'Lyrics',
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 256.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (albums.length % 2 == 1 && index >= albums.length) {
                  return _AlbumPlaceholder();
                }
                return GridCard(
                  title: '',
                  image: Image.asset(
                    albums.elementAt(index).imagePath,
                  ),
                  nextPage: AlbumPage(
                    album: albums.elementAt(index),
                  ),
                );
              },
              childCount: albums.length + albums.length % 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _AlbumPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).disabledColor.withOpacity(0.05),
      child: InkWell(
        splashColor: Theme.of(context).disabledColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.0),
        onTap: () {},
        child: Align(
          child: Text(
            'The next album goes here!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).disabledColor,
              fontFamily: 'Vollkorn',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
