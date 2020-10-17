import 'package:flutter/material.dart';
import 'package:weeeklyapp/data/member.dart';

class Members extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: 256,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(top: 236),
            title: ImageIcon(
              AssetImage('assets/images/logo/weeekly.png'),
              size: 128,
            ),
            centerTitle: true,
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/members/we-can/weeekly-we-can.jpg',
                  fit: BoxFit.cover,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, 1.0),
                      end: Alignment(0.0, 0.0),
                      colors: [
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.5),
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(6.0),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 32.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final member = Member.members.elementAt(index);
              return InkResponse(
                radius: 72,
                onTap: () => Navigator.of(context).push(
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
                            child: _Profile(member: member),
                          );
                        },
                      );
                    },
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                        createRectTween: (begin, end) =>
                            MaterialRectCenterArcTween(begin: begin, end: end),
                        tag: member.imagePath,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(member.imagePath),
                          radius: 48.0,
                        ),
                      ),
                    ),
                    Text(
                      member.stageName,
                      style: TextStyle(
                        fontFamily: 'Jua',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: Member.members.length,
          ),
        ),
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  final Member member;

  _Profile({@required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 560,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(top: 236),
              title: Text(
                member.stageName,
                style: TextStyle(
                  fontFamily: 'Jua',
                  fontSize: 32,
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: member.imagePath,
                    child: Image.asset(
                      member.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  _FadeInGradient(),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                ListTile(
                  leading: Container(
                    width: 100,
                    child: Text('Name'),
                  ),
                  title: Text(member.fullName),
                ),
                ListTile(
                  leading: Container(
                    width: 100,
                    child: Text('Birthday'),
                  ),
                  title: Text(
                    MaterialLocalizations.of(context).formatShortDate(
                      member.birthday,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FadeInGradient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FadeInGradientState();
}

class _FadeInGradientState extends State<_FadeInGradient> {
  double kOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        kOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).
      opacity: kOpacity,
      duration: Duration(milliseconds: 100),
      // The green box must be a child of the AnimatedOpacity widget.
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            stops: [0.0, 0.195, 0.5, 1.0],
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
              Theme.of(context).scaffoldBackgroundColor
            ],
          ),
        ),
      ),
    );
  }
}
