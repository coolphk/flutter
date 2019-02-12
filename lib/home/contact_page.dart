import 'package:flutter/material.dart';
import '../modal/contact.dart';

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
    );
  }
}
