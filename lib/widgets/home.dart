import 'package:flutter/material.dart';
import 'package:weeeklyapp/widgets/lyrics.dart';
import 'package:weeeklyapp/widgets/mainappbar.dart';
import 'package:weeeklyapp/widgets/profiles.dart';

class Home extends StatefulWidget {
  static final List<_Page> pages = [
    _Page(
      title: 'Lyrics',
      page: Lyrics(),
      picture: AssetImage('assets/images/home_buttons/lyrics.jpg'),
    ),
    _Page(
      title: 'Profiles',
      page: Profiles(),
      picture: AssetImage('assets/images/home_buttons/profiles.png'),
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
              return Card(
                margin: const EdgeInsets.all(4.0),
                elevation: 5,
                child: InkWell(
                  borderRadius: BorderRadius.circular(4.0),
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder<void>(
                        pageBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                        ) {
                          return AnimatedBuilder(
                            animation: animation,
                            builder: (BuildContext context, Widget child) {
                              return Opacity(
                                opacity: Interval(
                                  0.0,
                                  1.0,
                                  curve: Curves.fastOutSlowIn,
                                ).transform(animation.value),
                                child: button.page,
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: button.picture,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Expanded(child: button.picture),
                          Spacer(),
                          ListTile(
                            title: Text(
                              button.title,
                              style: TextStyle(
                                fontFamily: 'Jua',
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
  final ImageProvider picture;
  _Page({
    @required this.title,
    @required this.page,
    @required this.picture,
  });
}
