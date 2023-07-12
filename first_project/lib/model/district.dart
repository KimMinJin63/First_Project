import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class District {
  String? address;
  String? category;
  // List<String>? categoryList;
  String? name;
  String? telNum;
  String? time;
  String? menu;
  String? booking;
  String? parking;
  String? subway;
  String? bus;
  
  District({
    this.address,
    this.category,
    // this.categoryList,
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
      'address': address,
      'category': category,
      // 'categoryList': categoryList,
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
      address: map['address'] != null ? map['address'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      // categoryList: map['categoryList'] != null ? List<String>.from((map['categoryList'] as List<String>)) : null,
      name: map['name'] != null ? map['name'] as String : null,
      telNum: map['telNum'] != null ? map['telNum'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      menu: map['menu'] != null ? map['menu'] as String : null,
      booking: map['booking'] != null ? map['booking'] as String : null,
      parking: map['parking'] != null ? map['parking'] as String : null,
      subway: map['subway'] != null ? map['subway'] as String : null,
      bus: map['bus'] != null ? map['bus'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) => District.fromMap(json.decode(source) as Map<String, dynamic>);
}
