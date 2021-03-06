import 'package:flutter/material.dart';
import 'navigation_icon_view.dart';
import '../app_config.dart' show Constants, AppColors;
import 'conversation_page.dart';
import 'contact_page.dart';

enum ActionItems {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP,
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<NavigationIconView> _navicationViews;
  PageController _pageController;
  List<Widget> _pages;

  void initState() {
    super.initState();
    _navicationViews = <NavigationIconView>[
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(
            0xe601,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe656,
            fontFamily: Constants.IconFontFamily,
          )),
      NavigationIconView(
          title: '发现',
          icon: IconData(
            0xe600,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe671,
            fontFamily: Constants.IconFontFamily,
          )),
      NavigationIconView(
          title: '我',
          icon: IconData(
            0xe6c0,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe626,
            fontFamily: Constants.IconFontFamily,
          )),
    ];
    _pages = [
      ConversationPage(),
      ContactsPage(),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.green,
      )
    ];
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(
      items:
          _navicationViews.map((NavigationIconView view) => view.item).toList(),
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          //定义页面切换时的滚动动画
          _pageController.animateToPage(_currentIndex,
              duration: Duration(milliseconds: 200), curve: Curves.linear);
        });
      },
      fixedColor: Color(AppColors.TabIconActive),
      currentIndex: _currentIndex,
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              IconData(0xe65e, fontFamily: Constants.IconFontFamily),
              size: 22,
            ),
            tooltip: "搜索",
            onPressed: () {
              print("搜索");
            },
            padding: EdgeInsets.fromLTRB(0, 0, 16.0, 0),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe69e, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe638, "添加朋友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe61b, "扫一扫"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe62a, "收付款"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe63d, "帮助与反馈"),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(
              IconData(0xe658, fontFamily: Constants.IconFontFamily),
              size: 22,
            ),
            onSelected: (ActionItems selected) {
              print(selected);
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  _buildPopupMunuItem(int iconId, String title) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(
            iconId,
            fontFamily: Constants.IconFontFamily,
          ),
          color: const Color(AppColors.AppBarPopupMenuColor),
        ),
        Container(
          width: 16.0,
        ),
        Text(title,
            style:
                TextStyle(color: const Color(AppColors.AppBarPopupMenuColor)))
      ],
    );
  }
}
