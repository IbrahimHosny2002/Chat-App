import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message_mode.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.messageModel, super.key});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 15, right: 16, bottom: 32, top: 32),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: kPrimaryColor),
        child: Text(
          '${messageModel.id} : ${messageModel.message}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({required this.messageModel, super.key});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 15, right: 16, bottom: 32, top: 32),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            color:Color(0XFF006D84)),
        child: Text(
          '${messageModel.id} : ${messageModel.message}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
