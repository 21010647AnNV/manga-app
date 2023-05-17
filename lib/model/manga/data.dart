import 'package:comic_app/model/manga/attributes.dart';
import 'package:comic_app/model/manga/relationship.dart';

class Data {
  final String id;
  final String type;
  final Attributes attributes;
  final List<Relationships> relationships;

  Data(
      {required this.id,
      required this.type,
      required this.attributes,
      required this.relationships});

  factory Data.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? '';
    final type = json['type'] ?? '';

    final attributes = Attributes.fromJson(json['attributes']);

    final List<Relationships> relationships = [];
    json['relationships'].forEach((v) {
      relationships.add(Relationships.fromJson(v));
    });

    return Data(
        id: id,
        type: type,
        attributes: attributes,
        relationships: relationships);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;

    data['attributes'] = attributes.toJson();

    data['relationships'] = relationships.map((v) => v.toJson()).toList();

    return data;
  }
}
