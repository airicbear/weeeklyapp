import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String imagePath;
  final String title;

  const MainAppBar({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 256,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(top: 236),
        title: this.title == 'weeekly'
            ? ImageIcon(
                AssetImage('assets/images/logo/weeekly.png'),
                size: 192,
              )
            : Center(
                child: ListTile(
                  title: FittedBox(
                    child: Text(
                      this.title,
                      style: TextStyle(
                        fontFamily: 'Vollkorn',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
        centerTitle: true,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              this.imagePath,
              fit: BoxFit.cover,
              gaplessPlayback: true,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  stops: [0.0, 0.3, 0.5, 1.0],
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
