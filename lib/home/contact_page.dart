import 'package:flutter/material.dart';
import '../modal/contact.dart';

class _ContactItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;

  _ContactItem({@required this.avatar, @required this.title, this.groupTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.network(avatar,width: 100.0,),
          SizedBox(
            width: 10.0,
          ),
          Text(title)
        ],
      ),
    );
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
        return _ContactItem(
          avatar: _contacts[index].avatar,
          title: _contacts[index].name,
        );
      },
      itemCount: _contacts.length,
    );
  }
}
