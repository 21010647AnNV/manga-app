import 'package:comic_app/model/chapter/attribute.dart';

class Data {
  final String id;
  final String type;
  final Attributes attributes;

  Data({required this.id, required this.type, required this.attributes});

  factory Data.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? '';
    final type = json['type'] ?? '';
    final attributes = Attributes.fromJson(json['attributes']);

    return Data(id: id, type: type, attributes: attributes);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['attributes'] = attributes.toJson();

    return data;
  }
}
