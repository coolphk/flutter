import 'package:flutter/material.dart';

class Tools {
  static Image getAvatar(String avatar, double width, {double height}) {
    Image image = Image.asset(
      'assets/images/default_nor_avatar.png',
      width: width,
    );
    if (avatar.indexOf("https") == -1) {
      image = Image.asset(
        avatar,
        width: width,
      );
    } else {
      image = Image.network(
        avatar,
        width: width,
      );
    }
    return image;
  }
}
