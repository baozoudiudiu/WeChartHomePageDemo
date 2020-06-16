import 'package:flutter/material.dart';
import 'package:flutterappone/pch.dart';

class MessageSearchButton extends StatelessWidget {
  void Function() callBack;

  MessageSearchButton({this.callBack});

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(153, 153, 153, 1.0);
    return GestureDetector(
      onTap: () {
        callBack();
      },
      child: Container(
        color: Color.fromRGBO(230, 230, 230, 1),
        height: 54.0,
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/fangdajing.png",
                width: 20,
                color: color,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "搜索",
                style: TextStyle(
                  color: color,
                  fontSize: 16.5,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MessageSearchInput extends StatefulWidget {
  // callback where the textfield content has changed
  ValueChanged<String> textChanged;
  MessageSearchInput({this.textChanged});
  @override
  _MessageSearchInputState createState() => _MessageSearchInputState();
}

class _MessageSearchInputState extends State<MessageSearchInput> {
  // controller for textfield
  TextEditingController _controller = TextEditingController();
  // is used to control the display of the delete button in the textfield.
  bool _showClear = false;
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: statusBarHeight + 44.0,
      color: kThemeColors,
      child: Container(
        padding: EdgeInsets.only(top: statusBarHeight - 4, bottom: 8, left: 8),
        child: Row(
          children: <Widget>[
            Container(
              child: Expanded(
                flex: 1,
                child: Container(
                  height: 44.0,
                  padding: EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      Expanded(
                        flex: 1,
                        child: Material(
                          child: TextField(
                            controller: _controller,
                            onChanged: (text) {
                              this._textFieldContentChanged(text);
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10, left: 4.0),
                              border: InputBorder.none,
                              hintText: "搜索"
                            ),
                          ),
                        ),
                      ),
                      _showClear ? Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(bottom: 8, right: 8),
                        child: Material(
                          child: IconButton(
                            onPressed: () {
                              _controller.text = "";
                              _textFieldContentChanged("");
                            },
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.zero,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  minWidth: 50,
                  child: Text(
                    "取消",
                    style: TextStyle(fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // callback method where the textfield content has changed
  void _textFieldContentChanged(String text) {
      bool tag = text != "" ? true : false;
      setState(() {
        _showClear = tag;
      });
      this.widget.textChanged(text);
  }
}
