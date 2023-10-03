import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyInfo {
  String name;
  String? photoUrl;
  
  MyInfo({
    required this.name,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory MyInfo.fromMap(Map<String, dynamic> map) {
    return MyInfo(
      name: map['name'] as String,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyInfo.fromJson(String source) => MyInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
