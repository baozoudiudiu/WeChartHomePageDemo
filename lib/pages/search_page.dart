import 'package:flutter/material.dart';
import 'package:flutterappone/costom/message_search_button.dart';
import 'package:flutterappone/costom/search_list_cell.dart';
import 'package:flutterappone/model/message_model.dart';
import 'package:flutterappone/pch.dart';

class SearchPage extends StatefulWidget {
  final List<MessageItem> datas;
  List<MessageItem> _showDatas = [];

  SearchPage({this.datas});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _currentText = "";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kThemeColors,
        child: Column(
          children: <Widget>[
            MessageSearchInput(textChanged: (text) {
              _searchTextChanged(text);
            }),
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: widget._showDatas.length,
                      itemBuilder: (cxt, index) {
                        MessageItem item = widget._showDatas[index];
                        return SearchListCell(item.imgUrl, item.name, item.msg, _currentText);
                      }),
                ))
          ],
        ),
      ),
    );
  }

  void _searchTextChanged(String text) {
    List<MessageItem> arr = [];
    if (text != null && text != "") {
      widget.datas.forEach((element) {
        String name = element.name;
        if (name.contains(text)) {
          arr.add(element);
        }
      });
    }
    setState(() {
      widget._showDatas = arr;
      _currentText = text;
    });
  }
}
