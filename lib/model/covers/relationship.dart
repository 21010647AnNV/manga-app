import 'package:comic_app/model/covers/attribute.dart';

class Relationships {
  final String id;
  final String type;
  final Attributes attributes;
  final String related;

  Relationships(
      {required this.id,
      required this.type,
      required this.attributes,
      required this.related});

  factory Relationships.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? '';
    final type = json['type'] ?? '';
    final attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : Attributes(
            description: '',
            volume: '',
            fileName: '',
            locale: '',
            createdAt: '',
            updatedAt: '',
            version: 0);
    final related = json['related'] ?? '';

    return Relationships(
        id: id, type: type, attributes: attributes, related: related);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['attributes'] = attributes.toJson();
    data['related'] = related;
    return data;
  }
}
