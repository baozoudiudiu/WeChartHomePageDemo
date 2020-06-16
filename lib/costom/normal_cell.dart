import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappone/pages/discover_subpage.dart';

class NormalCell extends StatefulWidget {
  final String assetImageName;
  final String networkImageName;
  final String title;

  @override
  _NormalCellState createState() => _NormalCellState();
  NormalCell(this.title, {Key key, this.assetImageName, this.networkImageName}):super(key: key);
}

class _NormalCellState extends State<NormalCell> {
  final Color normalColor = Colors.white;
  final Color selectedColor = Color.fromRGBO(240, 240, 240, 1);
  Color _currentColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (detail){
        setState(() {
          _currentColor = selectedColor;
        });
      },
      onTap: (){
        setState(() {
          _currentColor = normalColor;
        });
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DiscoverSubpage(widget.title);
        }));
      },
      onTapCancel: (){
        setState(() {
          _currentColor = normalColor;
        });
      },
      child: Container(
        color: _currentColor,
        padding: EdgeInsets.only(left: 16, top: 14, bottom: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: null == widget.assetImageName ? DecorationImage(image: NetworkImage(widget.networkImageName)) : DecorationImage(image: AssetImage(widget.assetImageName)),
              ),
            ),
            SizedBox(width: 20,),
            Text(widget.title),
          ],
        ),
      ),
    );
  }
}

class Friends {
  final String imageUrl;
  final String assetName;
  final String name;
  final String indexLetter;
  const Friends({this.imageUrl, this.name, this.indexLetter, this.assetName});
}

List <Friends> friendsTopDatas = [
  Friends(
      assetName: 'images/new_friend.png',
      name: '新的朋友',
      indexLetter: 'A'
  ),
  Friends(
      assetName: 'images/chart_group.png',
      name: '群聊',
      indexLetter: 'A'
  ),
  Friends(
      assetName: 'images/tag.png',
      name: '标签',
      indexLetter: 'A'
  ),
  Friends(
      assetName: 'images/gongzhonghao.png',
      name: '公众号',
      indexLetter: 'A'
  ),
];

List <Friends> friendsDatas = [
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/16.jpg',
      name: '安莉',
      indexLetter: 'A'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/31.jpg',
      name: '阿贵',
      indexLetter: 'A'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/24.jpg',
      name: 'Abby',
      indexLetter: 'A'
  ),

  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/15.jpg',
      name: 'Betty',
      indexLetter: 'B'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/22.jpg',
      name: '贝拉',
      indexLetter: 'B'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/36.jpg',
      name: 'Colin',
      indexLetter: 'C'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/27.jpg',
      name: 'Lina',
      indexLetter: 'L'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: '菲儿',
      indexLetter: 'F'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/37.jpg',
      name: 'Lina',
      indexLetter: 'L'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/18.jpg',
      name: 'Nancy',
      indexLetter: 'N'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/47.jpg',
      name: '扣扣',
      indexLetter: 'K'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      name: 'Jack',
      indexLetter: 'J'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
      name: 'Emma',
      indexLetter: 'E'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg',
      name: 'Tony',
      indexLetter: 'T'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/26.jpg',
      name: 'Jerry',
      indexLetter: 'J'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
      name: 'Haha',
      indexLetter: 'H'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/11.jpg',
      name: 'Ketty',
      indexLetter: 'K'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/13.jpg',
      name: 'Lina',
      indexLetter: 'L'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
      name: 'Lina',
      indexLetter: 'L'
  ),
];
