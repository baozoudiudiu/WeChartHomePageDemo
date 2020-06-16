import 'package:flutter/material.dart';

class SearchListCell extends StatelessWidget {
  final String iconUrl;
  final String name;
  final String message;
  final String keyWords;

  final TextStyle _normalStyle = TextStyle(
    fontSize: 15,
    color: Colors.black,
  );
  final TextStyle _hightLightStyle = TextStyle(
    fontSize: 15,
    color: Colors.green,
  );

  SearchListCell(this.iconUrl, this.name, this.message, this.keyWords);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 8.0),
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(image: NetworkImage(this.iconUrl)),
            ),
          ),
          Container(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: _loadRichTextFrom(keyWords),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    this.message,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    maxLines: 1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _loadRichTextFrom(String keywords) {
    List<String> strArr = this.name.split(keywords);
    List<TextSpan> texts = [];
    for (int i = 0; i < strArr.length; i++) {
      String str = strArr[i];
      if (str == "") {
        if (i == 0 || (i == strArr.length - 1 && strArr[i - 1] == "")) {
          texts.add(TextSpan(text: keywords, style: _hightLightStyle));
        }
      } else {
        texts.add(TextSpan(text: str, style: _normalStyle));
        if (i < strArr.length - 1) {
          texts.add(TextSpan(text: keywords, style: _hightLightStyle));
        }
      }
    }
    return texts;
  }
}
