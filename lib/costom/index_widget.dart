import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappone/model/datas.dart';

class IndexWidget extends StatefulWidget {
  @override
  void Function(String indexString) indexChanged;

  _IndexWidgetState createState() => _IndexWidgetState();

  IndexWidget({Key key, this.indexChanged}) : super(key: key);
}

class _IndexWidgetState extends State<IndexWidget> {
  List<Widget> _indexWidgets;
  Color _textColor = Colors.black;
  Color _indexBackgroundColor = Color.fromRGBO(0, 0, 0, 0.0);
  String _qiPaoText = "";
  bool _showQiPao = false;
  double _alignmentY = 0.0;
  final double _itemHeight = 15.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: _itemHeight * indexStringArr.length,
        child: Row(
          children: <Widget>[
            _showQiPao ? _loadLeftQiPao() : Text(""),
            GestureDetector(
              onVerticalDragDown: (detail) {
                _drap(detail.localPosition.dy, detail.globalPosition.dy);
              },
              onVerticalDragUpdate: (detail) {
                if (_textColor != Colors.white) {
                  setState(() {
                    _textColor = Colors.white;
                    _indexBackgroundColor = Color.fromRGBO(1, 1, 1, 0.6);
                    _showQiPao = true;
                  });
                }
                _drap(detail.localPosition.dy, detail.globalPosition.dy);
              },
              onVerticalDragEnd: (detail) {
                setState(() {
                  _textColor = Colors.black;
                  _indexBackgroundColor = Color.fromRGBO(1, 1, 1, 0.0);
                  _showQiPao = false;
                });
              },
              child: Container(
                color: _indexBackgroundColor,
                child: Column(
                  children: _loadIndexWidget(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 获取索引widget
  List<Widget> _loadIndexWidget() {
    _indexWidgets = [];
    for (int i = 0; i < indexStringArr.length; i++) {
      _indexWidgets.add(Container(
        height: _itemHeight,
        child: Text(
          indexStringArr[i],
          style: TextStyle(
            color: _textColor,
            fontSize: 12.0,
          ),
        ),
      ));
    }
    return _indexWidgets;
  }

  /// 根据手势获取下标
  int _getIndexFrom(double y) {
    double height = _itemHeight;
    return y ~/ height;
  }

  /// 手势触发逻辑
  void _drap(double y, double globalY) {
    int i = _getIndexFrom(y);
    i = i.clamp(0, 27);
    String str = indexStringArr[i];
    setState(() {
      _alignmentY = -1.05 + i * 0.0777778;
    });
    if (null != widget.indexChanged) {
      setState(() {
        _qiPaoText = str;
      });
      widget.indexChanged(str);
    }
  }

  /// 左边的气泡
  Widget _loadLeftQiPao() {
    Widget c = Container(
      margin: EdgeInsets.only(right: 16),
      width: 54,
      child: Align(
        alignment: Alignment(0.0, _alignmentY),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/qipao.png")),
          ),
          child: Align(
            alignment: Alignment(-0.12, 0.0),
            child: Text(_qiPaoText),
          ),
        ),
      ),
    );
    return c;
  }
}
