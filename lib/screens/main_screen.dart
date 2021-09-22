import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/coins_score.dart';
import '../widgets/grid_item.dart';
import '../widgets/user.dart';
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
  final _containerKey = GlobalKey();
  final _redKey = GlobalKey();
  final _blueKey = GlobalKey();
  final _greenKey = GlobalKey();

  bool _greenSelected = false;
  bool _blueSelected = false;
  bool _redSelected = false;

  @override
  void initState() {
    super.initState();
    // _controller.addListener(() {
    //   print(_controller.offset);
    // });
    // WidgetsBinding.instance!.addPostFrameCallback(_getPosition);
  }

  void _getPosition(_) {
    print('fss');
    // if (details.primaryVelocity! < 0) {
    //   _controller.nextPage(
    //       duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    // } else if (details.primaryVelocity! > 0) {
    //   _controller.previousPage(
    //       duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    // }
    final containerWidth = _containerKey.currentContext!.size!.width;

    final renderBoxBlue =
        _blueKey.currentContext!.findRenderObject() as RenderBox;
    final positionBlue = renderBoxBlue.localToGlobal(Offset.zero).dx;

    if (positionBlue > 0 && positionBlue < containerWidth) {
      setState(() {
        _blueSelected = true;
        _greenSelected = false;
        _redSelected = false;
      });
      print('trueee');
    } else {
      setState(() {
        _blueSelected = false;
      });
    }

    final renderBoxRed =
        _redKey.currentContext!.findRenderObject() as RenderBox;
    final positionRed = renderBoxRed.localToGlobal(Offset.zero).dx;

    if (positionRed > 0 && positionRed < containerWidth) {
      setState(() {
        _blueSelected = false;
        _greenSelected = false;
        _redSelected = true;
      });
      print('trueee');
    } else {
      setState(() {
        _redSelected = false;
      });
    }

    final renderBoxGreen =
        _greenKey.currentContext!.findRenderObject() as RenderBox;
    final positionGreen = renderBoxGreen.localToGlobal(Offset.zero).dx;

    if (positionGreen > 0 && positionGreen < containerWidth) {
      setState(() {
        _greenSelected = true;
        _redSelected = false;
        _blueSelected = false;
      });
      print('trueee');
    } else {
      setState(() {
        _greenSelected = false;
      });
    }
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: const <Widget>[
                    User(name: 'Jon Doe'),
                    CoinsScore(),
                  ],
                ),
              ),
              Container(
                color: kBlueColor,
                width: 250,
                height: 250,
              ),

              // Dismissible(
              //   key: UniqueKey(),
              //   direction: DismissDirection.horizontal,
              //   confirmDismiss: (direction) {
              //     if (direction == DismissDirection.horizontal) {
              //       _getPosition();
              //     }
              //     return Future.value(false);
              //   },
              GestureDetector(
                onHorizontalDragDown: _getPosition,
                // onHorizontalDragStart: _getPosition,
                // onPointerMove: _getPosition,
                // onTap: () {
                //   print('tapped');
                // },
                // onHorizontalDragDown: (_) {
                // print('positionnnnnnnnnn ${_controller.position} nnnnnnnnnn');
                // MediaQuery.of(context).size.bottomLeft(Offset.zero);
                // final startPosition =
                //     MediaQuery.of(context).size.bottomLeft(Offset.zero);
                // final endPosition =
                //     MediaQuery.of(context).size.bottomRight(Offset.infinite
                //     );
                // print('start position $startPosition');
                // print('end position $endPosition');
                // if (_controller.offset < endPosition.direction &&
                //     _controller.offset > startPosition.direction) {
                //   print('fsd');
                // }
                // },
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.grey,
                  //   border: Border.all(
                  //     color: Colors.black,
                  //   ),
                  // ),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: PageView(
                      key: _containerKey,
                      // dragStartBehavior: DragStartBehavior.down,
                      controller: _controller,
                      // dragStartBehavior: DragStartBehavior.down,
                      // physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 1,
                      // crossAxisSpacing: 10,
                      // mainAxisSpacing: 10,
                      // childAspectRatio: 3 / 2,
                      // ),
                      children: [
                        GridItem(
                          key: _greenKey,
                          isSelected: _greenSelected,
                          icon: Icons.person_sharp,
                          title: 'Play',
                        ),
                        GridItem(
                          key: _blueKey,
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(QuizScreen.routeName);
                          },
                          isSelected: _blueSelected,
                          icon: Icons.person_sharp,
                          title: 'Play',
                        ),
                        GridItem(
                          key: _redKey,
                          isSelected: _redSelected,
                          icon: Icons.person_sharp,
                          title: 'Play',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  Text('Swip'),
                  Icon(Icons.arrow_forward),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
