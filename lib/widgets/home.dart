import 'package:flutter/material.dart';
import 'package:weeeklyapp/data/data.dart';
import 'package:weeeklyapp/widgets/grid_card.dart';
import 'package:weeeklyapp/widgets/lyrics_index.dart';
import 'package:weeeklyapp/widgets/main_appbar.dart';
import 'package:weeeklyapp/widgets/profiles_index.dart';

class Home extends StatefulWidget {
  static final List<_Page> pages = [
    _Page(
      title: 'Lyrics',
      page: Lyrics(
        albums: Data.albums,
      ),
      picture: Image.asset('assets/images/home_buttons/lyrics.jpg'),
    ),
    _Page(
      title: 'Profiles',
      page: Profiles(),
      picture: Image.asset('assets/images/home_buttons/profiles.png'),
    ),
  ];

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MainAppBar(
          imagePath: 'assets/images/members/we-can/weeekly-we-can.jpg',
          title: 'weeekly',
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 256.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              _Page button = Home.pages.elementAt(index);
              return GridCard(
                title: button.title,
                nextPage: button.page,
                image: button.picture,
              );
            },
            childCount: Home.pages.length,
          ),
        )
      ],
    );
  }
}

class _Page {
  final String title;
  final Widget page;
  final Image picture;
  _Page({
    @required this.title,
    @required this.page,
    @required this.picture,
  });
}
