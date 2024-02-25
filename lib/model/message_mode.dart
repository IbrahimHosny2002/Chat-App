import 'package:chat_app/constants.dart';

class MessageModel{
  final String message;
  final String id;
  MessageModel(this.id,this.message);
  factory MessageModel.fromJson(json){
    return MessageModel(json['id'],json[kMessage]);
  }
}