import 'package:flutter/material.dart';
import 'package:we_chat/app_config.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart';

class _ConversationItem extends StatelessWidget {
  final Conversation conversation;

  const _ConversationItem({Key key, this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Image.asset(
            conversation.avatar,
            width: Constants.ConversationAvatarSize,
          ),
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
          Column(children: <Widget>[
            Text(
              conversation.updateAt,
              style: AppStyles.TitleStyle,
            )
          ])
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
        return _ConversationItem(
          conversation: Conversation.mockConversations[index],
        );
      },
      itemCount: Conversation.mockConversations.length,
    );
  }
}
