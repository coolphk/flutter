import 'package:flutter/material.dart';
import 'package:we_chat/utils/tools.dart';
import '../modal/contact.dart';
import 'package:we_chat/app_config.dart' show AppColors, AppStyles, Constants;

class _ContactItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  _ContactItem(
      {@required this.avatar,
      @required this.title,
      this.groupTitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    //列表项主体部分
    Widget _button = Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor),
                  width: Constants.DividerWidth))),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 13.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Tools.getAvatar(avatar, Constants.ContactAvatarSize),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            child: Text(
              title,
              style: AppStyles.TitleStyle,
            ),
          )
        ],
      ),
    );
    //分组标签
    Widget _itemBody;

    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            color: Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 13.0),
                child: Text(this.groupTitle,
                    style: AppStyles.GroupTitleItemTextStyle)),
          ),
          _button
        ],
      );
    } else {
      _itemBody = _button;
    }
    return Container(child: _itemBody);
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _contacts = [];
  final List<_ContactItem> _functionButtons = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: '新的朋友',
      onPressed: () {
        print('新的朋友');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: '群聊',
      onPressed: () => print('群聊'),
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: '标签',
      onPressed: () => print('标签'),
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: '公众号',
      onPressed: () => print('公众号'),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contacts
      ..addAll(data.contacts)
      ..addAll(data.contacts)
      ..addAll(data.contacts)
      ..sort((a, b) => a.nameIndex.compareTo(b.nameIndex));
    print(_contacts);
  }

  @override
  Widget build(BuildContext context) {
    Contact _contact;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index < _functionButtons.length) {
          return _functionButtons[index];
        } else {
          int _contactIndex = index - _functionButtons.length;
          _contact = _contacts[_contactIndex];
          bool _isGroupTitle = true;
          if (_contactIndex > 0 &&
              _contact.nameIndex == _contacts[_contactIndex - 1].nameIndex) {
            _isGroupTitle = false;
          }
          return _ContactItem(
            avatar: _contact.avatar,
            title: _contact.name,
            groupTitle: _isGroupTitle ? _contact.nameIndex : null,
          );
        }
      },
      itemCount: _contacts.length + _functionButtons.length,
    );
  }
}
