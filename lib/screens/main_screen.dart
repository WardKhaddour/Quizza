import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/grid_item.dart';
import '../widgets/player_details.dart';
import 'quiz_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = PageController(
    initialPage: 1,
    viewportFraction: 0.7,
  );

  int currentIndex = 1;
  final _pageViewKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // double getParentWidth() {
  //   return _pageViewKey.currentContext!.size!.width;
  // }

  void onPageChanged(int index) {
    if (_controller.page == 2) {
      _controller.jumpToPage(0);
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PlayerDetails(),
              ),
              Container(
                color: kBlueColor,
                width: 250,
                height: 250,
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: PageView(
                    key: _pageViewKey,
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: onPageChanged,
                    children: [
                      GridItem(
                        index: 0,
                        currentIndex: currentIndex,
                        // getParentWidth: getParentWidth,
                        icon: Icons.shuffle_outlined,
                        title: 'Random',
                      ),
                      GridItem(
                        index: 1,
                        currentIndex: currentIndex,

                        // getParentWidth: getParentWidth,
                        onTap: () {
                          Navigator.of(context).pushNamed(QuizScreen.routeName);
                        },
                        icon: Icons.play_arrow_outlined,
                        title: 'Play',
                      ),
                      GridItem(
                        currentIndex: currentIndex,

                        index: 2,
                        // getParentWidth: getParentWidth,
                        icon: Icons.people_outline,

                        title: 'With Friends',
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back,
                        color: kGreyColor.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Swip',
                      style: TextStyle(color: kGreyColor.withOpacity(0.5)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_forward,
                        color: kGreyColor.withOpacity(0.5)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
