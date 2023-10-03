// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/model/my_info.dart';

class Message {
  String content;
  DateTime sendDate;
  MyInfo myInfo;
  
  Message({
    required this.content,
    required this.sendDate,
    required this.myInfo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'sendDate': sendDate.millisecondsSinceEpoch,
      'myInfo': myInfo.toMap(),
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      content: map['content'] as String,
      sendDate: DateTime.fromMillisecondsSinceEpoch(map['sendDate'] as int),
      myInfo: MyInfo.fromMap(map['myInfo'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  static fromSnapshot(QueryDocumentSnapshot<Object?> doc) {}
}
