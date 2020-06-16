import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappone/pages/discover_subpage.dart';

class DiscoverCell extends StatefulWidget {
  @override
  String title;
  String iconName;
  String subTitle;
  DiscoverCell({this.title, this.iconName, this.subTitle}):super();
  _DiscoverCellState createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  var _currentColors = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentColors = Colors.white;
        });
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return DiscoverSubpage(widget.title);
        }));
      },
      onTapDown: (detail) {
        setState(() {
          _currentColors = Colors.grey[1000];
        });
      },
      onTapCancel: () {
        setState(() {
          _currentColors = Colors.white;
        });
      },
      child: Container(
        color: _currentColors,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // left
            Row(
              children: <Widget>[
                SizedBox(width: 8,),
                Image.asset(widget.iconName, width: 18, height: 18,),
                SizedBox(width: 8,),
                Text(widget.title)
              ],
            ),
            // right
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                null != widget.subTitle ? Text(widget.subTitle) : Text(""),
                Image.asset("images/icon_right.png", width: 15,),
                SizedBox(width: 8,),
              ],
            ),
            // line
          ],
        ),
      ),
    );
  }
}
