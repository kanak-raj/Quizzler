import 'package:flutter/material.dart';

// ignore: camel_case_types
class reusable extends StatelessWidget {
  reusable({@required this.colour, this.cardwidget, this.Onpress});
  final Color colour;
  final Widget cardwidget;
  final Function Onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpress,
      child: Container(
        child: cardwidget,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
