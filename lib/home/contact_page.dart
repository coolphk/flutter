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
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color(AppColors.DividerColor),
                      width: Constants.DividerWidth))),
          padding: EdgeInsets.symmetric(vertical: 10.0),
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
        ));
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
      onPressed: (){
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
      ..addAll(data.contacts);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index < _functionButtons.length) {
          return _functionButtons[index];
        } else {
          var contact = _contacts[index];
          return _ContactItem(
            avatar: contact.avatar,
            title: contact.name,
          );
        }
      },
      itemCount: _contacts.length + _functionButtons.length,
    );
  }
}
