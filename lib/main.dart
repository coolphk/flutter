import 'package:flutter/material.dart';
import 'app_config.dart';
import './home/home_screen.dart';

void main() =>
    runApp(MaterialApp(
        title: '微信',
        home: HomeScreen(),
        theme: ThemeData.light().copyWith(
            primaryColor: Color(AppColors.AppBarColor),
            cardColor: Color(AppColors.AppBarColor)), // 修改主题并自定义主题内相关样式

    ));
