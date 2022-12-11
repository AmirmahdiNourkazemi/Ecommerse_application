import 'package:flutter/material.dart';


Column categoryHorizontalListView() {
  return Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: Colors.red,
                  blurRadius: 25,
                  spreadRadius: -15,
                  offset: Offset(0.0, 15),
                )
              ],
              color: Colors.red,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Icon(
            Icons.mouse,
            color: Colors.white,
            size: 29,
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'همه',
        style: TextStyle(fontFamily: 'SB', fontSize: 17),
      )
    ],
  );
}