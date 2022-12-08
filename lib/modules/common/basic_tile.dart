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
    final data = MediaQuery.of(context);
    final screenHeight = data.size.height;
    final screenWidth = data.size.width;

    final tileHeight = screenHeight * 0.05;
    final tileWidth = screenWidth * 0.8;

    return InkWell(
      onTap: () {
        setState(() {
          widget.click();
        });
      },
      child: Container(
        alignment: Alignment.center,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: widget.fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
