class DiscoverItem {
  final String iconName;
  final String title;
  final String subTitle;
  const DiscoverItem(this.iconName, this.title, {this.subTitle});
}

const k_discoverItems = [
  DiscoverItem("images/pengyouquan.png", "朋友圈"),
  null,
  DiscoverItem("images/saoyisao2.png", "扫一扫"),
  DiscoverItem("images/yaoyiyao.png", "摇一摇"),
  null,
  DiscoverItem("images/kanyikan.png", "看一看"),
  DiscoverItem("images/souyisou.png", "搜一搜"),
  null,
  DiscoverItem("images/fujinderen.png", "附近的人"),
  null,
  DiscoverItem("images/gouwu.png", "购物"),
  DiscoverItem("images/youxi.png", "游戏"),
  null,
  DiscoverItem("images/xiaochengxu.png", "小程序"),
];

const List<DiscoverItem> k_mineItes = [
  null,
  DiscoverItem("images/pengyouquan.png", "支付"),
  null,
  DiscoverItem("images/saoyisao2.png", "收藏"),
  DiscoverItem("images/yaoyiyao.png", "相册"),
  DiscoverItem("images/kanyikan.png", "卡包"),
  DiscoverItem("images/souyisou.png", "表情"),
  null,
  DiscoverItem("images/fujinderen.png", "设置"),
];