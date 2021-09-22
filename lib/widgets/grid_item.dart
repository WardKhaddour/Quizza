import 'package:flutter/material.dart';
import '../constants.dart';

class GridItem extends StatelessWidget {
  GridItem(
      {this.isSelected = false,
      required this.icon,
      required this.title,
      Key? key,
      this.onTap})
      : super(key: key);
  // final Color color;
  final bool isSelected;
  final IconData icon;
  final String title;
  final focusNode = FocusNode();
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isSelected ? const EdgeInsets.all(8) : const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? kBlueColor : kGreyColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Icon(
                  icon,
                  color: !isSelected ? kBlueColor : Colors.white,
                  size: 54,
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    color: !isSelected ? kBlueColor : Colors.white,
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
