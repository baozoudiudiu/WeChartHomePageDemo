import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappone/costom/discover_cell.dart';
import 'package:flutterappone/costom/mine_header.dart';
import 'package:flutterappone/model/DiscoverItem.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Container(
                  child: ListView.builder(
                      itemCount: k_mineItes.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return MineHeaderView();
                        } else {
                          var i = index - 1;
                          var item = k_mineItes[i];
                          if (null == item) {
                            return SizedBox(
                              height: 8,
                            );
                          } else {
                            return DiscoverCell(
                              title: item.title,
                              iconName: item.iconName,
                            );
                          }
                        }
                      }),
                ),
              )),
          Positioned(
            width: 20,
            right: 24,
            top: 44,
            child: Container(
              child: Image.asset("images/xiangji.png"),
            ),
          ),
        ],
      ),
    );
  }
}
