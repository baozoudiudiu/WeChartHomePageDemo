import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MineHeaderView extends StatefulWidget {
  @override
  _MineHeaderViewState createState() => _MineHeaderViewState();
}

class _MineHeaderViewState extends State<MineHeaderView> {
  final double iconSize = 54;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Colors.white,
      padding: EdgeInsets.only(left: 16, top: 80),
      child: Row(
        children: <Widget>[
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(image: AssetImage("images/chart_group.png")),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.only(bottom: 24, top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "墨",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text("微信号:  dying357"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
