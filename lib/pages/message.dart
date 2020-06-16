import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappone/costom/message_search_button.dart';
import 'package:flutterappone/model/message_model.dart';
import 'package:flutterappone/pages/search_page.dart';
import 'package:http/http.dart' as http;

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final _colors = Color.fromRGBO(230, 230, 230, 1);
  List<MessageItem> _dataSource = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData().then((responseModel) {
      List<MessageItem> list = responseModel.data;
      setState(() {
        _dataSource = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: _colors,
        title: Text(
          "微信",
          style: TextStyle(
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            offset: Offset(-40, 40),
            color: Color.fromRGBO(1, 1, 1, 0.45),
            child: Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 20),
              child: Image.asset("images/corner_add.png"),
            ),
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.sort),
                      Text("发起群聊"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.sort),
                      Text("发起群聊"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.sort),
                      Text("发起群聊"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.sort),
                      Text("发起群聊"),
                    ],
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: ListView.separated(
          itemCount: _dataSource.length + 1,
          separatorBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 72),
              color: Color.fromRGBO(230, 230, 230, 1.0),
              height: 0.5,
            );
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return MessageSearchButton(callBack: () {
                Navigator.push(context, MaterialPageRoute(builder: (cxt){
                  return SearchPage(datas: this._dataSource,);
                }));
              });
            } else {
              MessageItem item = _dataSource[index - 1];
              return Container(
                margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 8.0),
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                              image: NetworkImage(item.imgUrl))),
                    ),
                    Container(
                      child: Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.name,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              item.msg,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  Future<MessageItemResponse> loadData() async {
    const String urlString =
        "http://rap2.taobao.org:38080/app/mock/257114/messageList";
    var response = await http.get(urlString);
    if (response.statusCode == 200) {
      // 请求成功
      MessageItemResponse resModel =
          MessageItemResponse.fromJson(response.body);
      return resModel;
    } else {
      // 请求失败
      return null;
    }
  }
}
