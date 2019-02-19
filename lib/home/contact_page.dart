import 'package:flutter/material.dart';
import '../modal/contact.dart';
import 'package:we_chat/app_config.dart' show AppColors, AppStyles, Constants;

class _ContactItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;

  _ContactItem({@required this.avatar, @required this.title, this.groupTitle});

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
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: <Widget>[
              Container(
                child: Image.network(
                  avatar,
                  width: Constants.ContactAvatarSize,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                child: Text(title),
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
  final List<Contact> _contacts = ContactsPageData.mock().contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var contact = _contacts[index];
        return _ContactItem(
          avatar: contact.avatar,
          title: contact.name,
        );
      },
      itemCount: _contacts.length,
    );
  }
}
