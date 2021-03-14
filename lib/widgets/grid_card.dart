import 'package:flutter/material.dart';
import 'package:weeeklyapp/widgets/page_transition.dart';

class GridCard extends StatelessWidget {
  final String title;
  final Widget nextPage;
  final Image image;

  const GridCard({
    Key key,
    this.title,
    this.nextPage,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(4.0),
      elevation: 5,
      child: Stack(
        children: [
          Ink.image(
            colorFilter: ColorFilter.mode(
              Theme.of(context)
                  .cardColor
                  .withOpacity(this.title.isEmpty ? 1.0 : 0.3),
              BlendMode.dstATop,
            ),
            image: image.image,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                PageTransition.to(nextPage),
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Vollkorn',
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
