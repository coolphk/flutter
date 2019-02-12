import 'package:flutter/material.dart';
import 'package:we_chat/app_config.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart';

class _ConversationItem extends StatelessWidget {
  final Conversation conversation;

  const _ConversationItem({Key key, this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatarContainer;
    Widget avatar = conversation.getAvatar(Constants.ContactAvatarSize);

    //未读消息角标
    if (conversation.unreadMsgCount > 0) {
      Container unreadMsgCountText = Container(
        width: Constants.UnReadMsgNotifyDotSize,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Constants.UnReadMsgNotifyDotSize / 2),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Center(
            child: Text(
          conversation.unreadMsgCount.toString(),
          style: AppStyles.UnreadMsgCountDotStyle,
        )),
      );

      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            right: -6.0,
            top: -6.0,
            child: unreadMsgCountText,
          )
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    //勿扰图标
    Widget _muteIcon(Color color) {
      return Icon(IconData(0xe755, fontFamily: Constants.IconFontFamily),
          size: Constants.ConversationMuteIconSize, color: color);
    }

    List<Widget> _rightArea = [
      Text(
        conversation.updateAt,
        style: AppStyles.TitleStyle,
      ),
      SizedBox(
        height: 10.0,
      )
    ];

    if (conversation.isMute) {
      _rightArea.add(_muteIcon(Color(AppColors.ConversationMuteIcon)));
    } else {
      _rightArea.add(_muteIcon(Colors.transparent));
    }

    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor),
                  width: Constants.DividerWidth))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    conversation.title,
                    style: AppStyles.TitleStyle,
                  ),
                  Text(
                    conversation.des,
                    style: AppStyles.DesStyle,
                  )
                ],
              ),
            ),
          ),
          Column(children: _rightArea)
        ],
      ),
    );
  }
}

class _DeviceInfoItem extends StatelessWidget {
  final device;

  const _DeviceInfoItem({this.device: Device.WIN}) : assert(device != null);

  int get iconName {
    return device == Device.WIN ? 0xe75e : 0xe640;
  }

  String get deviceName {
    return device == Device.WIN ? 'Windows' : 'MAC';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor),
                  width: Constants.DividerWidth))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            IconData(this.iconName, fontFamily: Constants.IconFontFamily),
            color: Color(AppColors.DeviceInfoItemIcon),
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            '${this.deviceName}微信已登录，手机通知已关闭',
            style: AppStyles.DeviceInfoItemTextStyle,
          )
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _DeviceInfoItem(device: Device.MAC);
        }
        return _ConversationItem(
          conversation: Conversation.mockConversations[index],
        );
      },
      itemCount: Conversation.mockConversations.length,
    );
  }
}
