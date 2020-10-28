import 'package:flutter/material.dart';
import 'package:weeeklyapp/widgets/mainappbar.dart';

class Lyrics extends StatelessWidget {
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
                return Card(
                  margin: const EdgeInsets.all(4.0),
                  elevation: 5,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4.0),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
