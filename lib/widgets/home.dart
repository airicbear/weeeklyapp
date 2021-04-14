import 'package:flutter/material.dart';
import 'package:weeeklyapp/data/data.dart';
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
      icon: Icon(Icons.menu_book),
    ),
    _Page(
      title: 'Profiles',
      page: Profiles(),
      icon: Icon(
        Icons.person,
      ),
    ),
  ];

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;
  Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = Home.pages.first.page;
    _tabController = TabController(
      length: Home.pages.length,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        _currentPage = Home.pages.elementAt(_tabController.index).page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: List<Tab>.generate(
          Home.pages.length,
          (index) => Tab(
            text: Home.pages.elementAt(index).title,
            icon: Home.pages.elementAt(index).icon,
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
          MainAppBar(
            imagePath: 'assets/images/members/we-can/weeekly-we-can.jpg',
            title: 'weeekly',
          ),
          _currentPage,
        ],
      ),
    );
  }
}

class _Page {
  final String title;
  final Widget page;
  final Icon icon;
  _Page({
    @required this.title,
    @required this.page,
    @required this.icon,
  });
}
