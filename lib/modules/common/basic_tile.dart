import 'package:flutter/material.dart';

class BasicTile extends StatefulWidget {
  const BasicTile({
    Key? key,
    required this.title,
    required this.color,
    required this.fontColor,
    required this.click,
  }) : super(key: key);

  final String title;
  final Color color;
  final Color fontColor;
  final Function click;

  @override
  State<BasicTile> createState() => _BasicTileState();
}

class _BasicTileState extends State<BasicTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.click();
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 59,
        width: 479,
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(
            color: Color(0xFFD9D9D9),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xCFD9D9D9),
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                4.0, // Move to right horizontally
                4.0, // Move to bottom Vertically
              ),
            )
          ],
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 24,
            color: widget.fontColor,
          ),
        ),
      ),
    );
  }
}
