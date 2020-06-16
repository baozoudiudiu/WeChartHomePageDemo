import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:flutterappone/costom/index_widget.dart';
import 'package:flutterappone/costom/normal_cell.dart';
import 'package:flutterappone/model/datas.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  Map _dataMap;
  List<String> _keys;
  SectionTableController _controller = SectionTableController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "通讯录",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
        bottomOpacity: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              child: SectionTableView(
            sectionCount: getKeys().length + 1,
            numOfRowInSection: (section) {
              if (section == 0) {
                return friendsTopDatas.length;
              } else {
                var key = getKeys()[section - 1];
                return getDataMap()[key].length;
              }
            },
            cellAtIndexPath: (section, row) {
              if (section == 0) {
                Friends f = friendsTopDatas[row];
                return NormalCell(
                  f.name,
                  assetImageName: f.assetName,
                );
              } else {
                var key = getKeys()[section - 1];
                Friends friends = getDataMap()[key][row];
                return NormalCell(
                  friends.name,
                  networkImageName: friends.imageUrl,
                );
              }
            },
            headerInSection: (section) {
              if (section == 0) {
                return Center();
              } else {
                var key = getKeys()[section - 1];
                return Container(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  height: 30.0,
                  padding: EdgeInsets.only(top: 7, left: 10),
                  child: Text("$key"),
                );
              }
            },
            divider: Container(
              margin: EdgeInsets.only(left: 60.0),
              color: Color.fromRGBO(220, 220, 220, 1),
              height: 0.5,
            ),
            controller: _controller,
            sectionHeaderHeight: (i) => i == 0 ? 0 : 30.0,
            dividerHeight: () => 0.5,
            cellHeightAtIndexPath: (sec, i) => 54.0,
          )),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: IndexWidget(indexChanged: (senderStr) {
              print(senderStr);
              List<String> keys = getKeys();
              for (int i = 0; i < keys.length; i++) {
                String key = keys[i];
                if (key == senderStr) {
                  _controller.jumpTo(i + 1, 0);
                  break;
                }
              }
            }),
          ),
        ],
      ),
    );
  }

  Map<String, List<Friends>> getMapFrom(List<Friends> sender) {
    var map = new Map<String, List<Friends>>();
    var keys = new List<String>();
    sender.forEach((model) {
      var tempArr = map[model.indexLetter];
      if (null == tempArr) {
        tempArr = new List<Friends>();
      }
      tempArr.add(model);
      map[model.indexLetter] = tempArr;
    });
    return map;
  }

  Map<String, List<Friends>> getDataMap() {
    if (null == _dataMap) {
      _dataMap = getMapFrom(friendsDatas);
    }
    return _dataMap;
  }

  List<String> getKeys() {
    if (null == _keys) {
      _keys = getDataMap().keys.toList();
      _keys.sort((a, b) => a.compareTo(b));
    }
    return _keys;
  }
}
