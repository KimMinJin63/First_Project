import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryList {
  String? korean;
  String? western;
  String? chinese;
  String? japanese;
  String? dessert;
  String? fusion;
  String? world;
  String? coffee;
  String? alchol;
  
  CategoryList({
    this.korean,
    this.western,
    this.chinese,
    this.japanese,
    this.dessert,
    this.fusion,
    this.world,
    this.coffee,
    this.alchol,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'korean': korean,
      'western': western,
      'chinese': chinese,
      'japanese': japanese,
      'dessert': dessert,
      'fusion': fusion,
      'world': world,
      'coffee': coffee,
      'alchol': alchol,
    };
  }

  factory CategoryList.fromMap(Map<String, dynamic> map) {
    return CategoryList(
      korean: map['korean'] != null ? map['korean'] as String : null,
      western: map['western'] != null ? map['western'] as String : null,
      chinese: map['chinese'] != null ? map['chinese'] as String : null,
      japanese: map['japanese'] != null ? map['japanese'] as String : null,
      dessert: map['dessert'] != null ? map['dessert'] as String : null,
      fusion: map['fusion'] != null ? map['fusion'] as String : null,
      world: map['world'] != null ? map['world'] as String : null,
      coffee: map['coffee'] != null ? map['coffee'] as String : null,
      alchol: map['alchol'] != null ? map['alchol'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryList.fromJson(String source) => CategoryList.fromMap(json.decode(source) as Map<String, dynamic>);
}
