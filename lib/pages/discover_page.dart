import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappone/costom/discover_cell.dart';
import 'package:flutterappone/model/DiscoverItem.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final _colors = Color.fromRGBO(240, 240, 240, 1);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: _colors,
        title: Text("发现", style: TextStyle(
          color: Color.fromRGBO(51, 51, 51, 1),
        ),),
      ),
      body: Container(
        color: _colors,
        child: ListView.builder(physics: ClampingScrollPhysics(), itemCount: k_discoverItems.length, itemBuilder: (context, index) {
          DiscoverItem item = k_discoverItems[index];
          if (null == item) {
            return SizedBox(height: 20,);
          }else {
            return DiscoverCell(title: item.title, iconName: item.iconName);
          }
        }),
      ),
    );
  }
}
