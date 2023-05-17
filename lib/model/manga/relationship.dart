class Relationships {
  final String id;
  final String type;

  Relationships({required this.id, required this.type});

  factory Relationships.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? '';
    final type = json['type'] ?? '';

    return Relationships(id: id, type: type);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}
