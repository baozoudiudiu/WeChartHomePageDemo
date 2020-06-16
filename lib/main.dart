import 'package:flutter/material.dart';
import 'package:flutterappone/pages/discover_page.dart';
import 'package:flutterappone/pages/friends_page.dart';
import 'package:flutterappone/pages/message.dart';
import 'package:flutterappone/pages/mine_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      theme: ThemeData(
        primarySwatch: Colors.green,
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: Color.fromRGBO(1, 0, 0, 0.0),
      ),
      home: RootPage(title: "根视图",),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RootPage extends StatefulWidget  {
  RootPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final titles = ["微信", "通讯录", "发现", "我的"];
  final icons = ["images/tabbar_chat.png","images/tabbar_friends.png", "images/tabbar_discover.png", "images/tabbar_mine.png"];
  final hl_icons = ["images/tabbar_chat_hl.png", "images/tabbar_friends_hl.png", "images/tabbar_discover_hl.png", "images/tabbar_mine_hl.png"];
  final double iconWidth = 24;
  var _currentIndex = 0;
  MinePage _minePage;
  DiscoverPage _discoverPage;
  FriendsPage _friendsPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [_getPages(0), _getPages(1),_getPages(2),_getPages(3)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text(titles[0]),
            icon: Image.asset(icons[0], width: iconWidth,),
            activeIcon: Image.asset(hl_icons[0], width: iconWidth,),
          ),
          BottomNavigationBarItem(
            title: Text(titles[1]),
            icon: Image.asset(icons[1], width: iconWidth,),
            activeIcon: Image.asset(hl_icons[1], width: iconWidth,),
          ),
          BottomNavigationBarItem(
            title: Text(titles[2]),
            icon: Image.asset(icons[2], width: iconWidth,),
            activeIcon: Image.asset(hl_icons[2], width: iconWidth,),
          ),
          BottomNavigationBarItem(
            title: Text(titles[3]),
            icon: Image.asset(icons[3], width: iconWidth,),
            activeIcon: Image.asset(hl_icons[3], width: iconWidth,),
          ),
        ],
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _tabItemDidSelected(index);
        },
      ),
    );
  }

  void _tabItemDidSelected(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }

  Widget _getPages(int index) {
    if (index == 3) {
      if (null == _minePage) {
        _minePage = MinePage();
      }
      return _minePage;
    }else if (index == 2) {
      if (null == _discoverPage) {
        _discoverPage = DiscoverPage();
      }
      return _discoverPage;
    }else if (index == 1) {
      if (null == _friendsPage) {
        _friendsPage = FriendsPage();
      }
      return _friendsPage;
    }else if (index == 0) {
      return MessagePage();
    }
    return DiscoverPage();
  }
}
