import 'dart:convert';

class MessageItem {
  final String imgUrl;
  final String name;
  final String msg;

  MessageItem({this.imgUrl, this.name, this.msg});

  factory MessageItem.fromJson(String jsonString) {
    Map map = json.decode(jsonString);
    return MessageItem.fromMap(map);
  }

  factory MessageItem.fromMap(Map map) {
    return MessageItem(
        imgUrl: map["imgUrl"], name: map["name"], msg: map["msg"]);
  }
}

class MessageItemResponse {
  final int code;
  final String status;
  final List<MessageItem> data;

  MessageItemResponse({this.code, this.status, this.data});

  factory MessageItemResponse.fromJson(String jsonString) {
    Map map = json.decode(jsonString);
    List list = map["data"];
    List<MessageItem> data = list.map((m) {
      return MessageItem.fromMap(m);
    }).toList();
    return MessageItemResponse(
        code: map["code"], status: map["status"], data: data);
  }
}
