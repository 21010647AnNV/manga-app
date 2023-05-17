import 'package:comic_app/model/covers/big_attribute.dart';
import 'package:comic_app/model/covers/relationship.dart';

class Data {
  final String id;
  final List<Relationships> relationships;
  final BigAttributes bigAttributes;

  Data({
    required this.id,
    required this.relationships,
    required this.bigAttributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? '';
    final relationships = <Relationships>[];
    json['relationships'].forEach((v) {
      if (Relationships.fromJson(v).attributes.fileName != '') {
        relationships.add(Relationships.fromJson(v));
      }
    });

    final bigAttributes = BigAttributes.fromJson(json['attributes']);

    return Data(
        id: id, relationships: relationships, bigAttributes: bigAttributes);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['relationships'] = relationships.map((v) => v.toJson()).toList();

    return data;
  }
}
