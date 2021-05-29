import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:weeeklyapp/model/song.dart';
import 'package:weeeklyapp/widgets/main_appbar.dart';

class LyricsPage extends StatefulWidget {
  final String imagePath;
  final Song song;

  const LyricsPage({
    Key? key,
    required this.song,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage>
    with SingleTickerProviderStateMixin {
  late List<dynamic> lyrics;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: widget.song.lyrics.allLyrics.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        lyrics =
            widget.song.lyrics.allLyrics.values.toList()[tabController.index];
      });
    });
    lyrics = widget.song.lyrics.allLyrics.entries.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        controller: tabController,
        tabs: List<Tab>.generate(
          widget.song.lyrics.allLyrics.length,
          (index) => Tab(
            text:
                widget.song.lyrics.allLyrics.keys.toList()[index].toUpperCase(),
          ),
        ),
        labelStyle: TextStyle(
          fontFamily: 'Vollkorn',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          MainAppBar(imagePath: widget.imagePath, title: widget.song.title),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final String line = lyrics[index];
                return ListTile(
                  title: line.startsWith('[')
                      ? HtmlWidget(
                          line.substring(1, line.length - 1),
                          textStyle: TextStyle(
                            fontFamily: 'Vollkorn',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).disabledColor,
                          ),
                        )
                      : HtmlWidget(
                          line,
                        ),
                );
              },
              childCount: lyrics.length,
            ),
          ),
        ],
      ),
    );
  }
}
