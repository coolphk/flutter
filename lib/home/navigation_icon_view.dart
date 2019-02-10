import 'package:flutter/material.dart';
import 'package:we_chat/app_config.dart' show AppColors;

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      :
        item = BottomNavigationBarItem(
            title: Text(title),
            icon: Icon(icon,color: Color(AppColors.TabIconNormal),),
            activeIcon: Icon(activeIcon,color: Color(AppColors.TabIconActive),),
            backgroundColor: Colors.white);
}
