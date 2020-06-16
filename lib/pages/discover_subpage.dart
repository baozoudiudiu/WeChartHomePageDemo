
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverSubpage extends StatelessWidget {
  final String titleString;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.titleString),
      ),
      body: Center(
        child: Text(this.titleString),
      ),
    );
  }
  DiscoverSubpage(this.titleString):super();
}
