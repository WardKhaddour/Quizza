import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants.dart';

class GridItem extends StatefulWidget {
  GridItem(
      {required this.icon,
      required this.title,
      // required this.parentWidth,
      required this.index,
      required this.currentIndex,
      // required this.getParentWidth,
      Key? key,
      this.onTap})
      : super(key: key);
  final IconData icon;
  final String title;
  final int index;
  final int currentIndex;
  // final double parentWidth;
  final void Function()? onTap;
  // final double Function() getParentWidth;

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  // final _key = GlobalKey();
  bool _isSelected = false;
  // double? parentWidth;
  // @override
  // void initState() {
  //   super.initState();
  //   print('current index item ${widget.currentIndex}');
  //   print(' index item ${widget.index}');
  //   if (widget.index == widget.currentIndex) {
  //     setState(() {
  //       _isSelected = true;
  //     });
  //   } else {
  //     setState(() {
  //       _isSelected = false;
  //     });
  //   }
  //   print('is selected $_isSelected');
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //     parentWidth = widget.getParentWidth.call();
  //     print('parent Width $parentWidth');
  //     getPosition();
  //   });
  // }

  // void getPosition() {
  //   final widgetRenderBox =
  //       _key.currentContext!.findRenderObject() as RenderBox;
  //   final position = widgetRenderBox.localToGlobal(Offset.zero).dx;
  //   print('position $position');
  //   if (position > 0 && position < parentWidth!) {
  //     print('Should change Color');
  //     setState(() {
  //       _isSelected = true;
  //     });
  //   } else {
  //     setState(() {
  //       _isSelected = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _isSelected = widget.index == widget.currentIndex;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        // key: _key,
        padding:
            _isSelected ? const EdgeInsets.all(8) : const EdgeInsets.all(16),
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: _isSelected ? kBlueColor : kGreyColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Icon(
                  widget.icon,
                  color: !_isSelected ? kBlueColor : Colors.white,
                  size: 64,
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: !_isSelected ? kBlueColor : Colors.white,
                    fontSize: 24,
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
