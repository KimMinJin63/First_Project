// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class District {
  String? cnt;
  String? address;
  String? category;
  String? name;
  String? telNum;
  String? time;
  String? menu;
  String? booking;
  String? parking;
  String? subway;
  String? bus;
  District({
    this.cnt,
    this.address,
    this.category,
    this.name,
    this.telNum,
    this.time,
    this.menu,
    this.booking,
    this.parking,
    this.subway,
    this.bus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cnt': cnt,
      'GNG_CS': address,
      'FD_CS': category,
      'BZ_NM': name,
      'TLNO': telNum,
      'MBZ_HR': time,
      'MNU': menu,
      'BKN_YN': booking,
      'PKPL': parking,
      'SBW': subway,
      'BUS': bus,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      cnt: map['cnt'] as String,
      address: map['GNG_CS'] as String,
      category: map['FD_CS'] as String,
      name: map['BZ_NM'] as String,
      telNum: map['TLNO'] as String,
      time: map['MBZ_HR'] as String,
      menu: map['MNU'] as String,
      booking: map['BKN_YN'] as String,
      parking: map['PKPL'] as String,
      subway: map['SBW'] as String,
      bus: map['BUS'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) => District.fromMap(json.decode(source) as Map<String, dynamic>);

  static District fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return District(
      cnt: data['cnt'] ?? '',
      address: data['GNG_CS'] ?? '',
      category: data['FD_CS'] ?? '',
      telNum: data['TLNO'] ?? '',
      time: data['MBZ_HR'] ?? '',
      menu: data['MNU'] ?? '',
      booking: data['BKN_YN'] ?? '',
      parking: data['PKPL'] ?? '',
      subway: data['SBW'] ?? '',
      bus: data['BUS'] ?? '',
      name: data['BZ_NM'] ?? '', 
    );
  }
}
