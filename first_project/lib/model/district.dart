// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
 
import 'package:cloud_firestore/cloud_firestore.dart';
 
class District {
  String cnt;
  String address;
  String category;
  String name;
  String telNum;
  String time;
  String menu;
  String booking;
  String parking;
  String subway;
  String bus;
  District({
    required this.cnt,
    required this.address,
    required this.category,
    required this.name,
    required this.telNum,
    required this.time,
    required this.menu,
    required this.booking,
    required this.parking,
    required this.subway,
    required this.bus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cnt': cnt,
      'address': address,
      'category': category,
      'name': name,
      'telNum': telNum,
      'time': time,
      'menu': menu,
      'booking': booking,
      'parking': parking,
      'subway': subway,
      'bus': bus,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      cnt: map['cnt'] as String,
      address: map['address'] as String,
      category: map['category'] as String,
      name: map['name'] as String,
      telNum: map['telNum'] as String,
      time: map['time'] as String,
      menu: map['menu'] as String,
      booking: map['booking'] as String,
      parking: map['parking'] as String,
      subway: map['subway'] as String,
      bus: map['bus'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) => District.fromMap(json.decode(source) as Map<String, dynamic>);

  static District fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return District(
      cnt: data['cnt'] ?? '',
      address: data['address'] ?? '',
      category: data['category'] ?? '',
      telNum: data['telNum'] ?? '',
      time: data['time'] ?? '',
      menu: data['menu'] ?? '',
      booking: data['booking'] ?? '',
      parking: data['parking'] ?? '',
      subway: data['subway'] ?? '',
      bus: data['bus'] ?? '',

      // Add other fields here...
      name: data['name'] ?? '', // Example for 'name' field
    );
  }
}
