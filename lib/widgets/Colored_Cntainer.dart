import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  var color;
  var text;
  var textColor;
  var icon;
  ColoredContainer(
      {Key? key,
      this.text = "",
      this.color,
      this.textColor = Colors.white,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Mukta',
          ),
        ),
      ),
    );
  }
}
