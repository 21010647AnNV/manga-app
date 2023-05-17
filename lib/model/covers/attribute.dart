class Attributes {
  final String description;
  final String volume;
  final String fileName;
  final String locale;
  final String createdAt;
  final String updatedAt;
  final int version;

  Attributes(
      {required this.description,
      required this.volume,
      required this.fileName,
      required this.locale,
      required this.createdAt,
      required this.updatedAt,
      required this.version});

  factory Attributes.fromJson(Map<String, dynamic> json) {
    final description = json['description'] ?? '';
    final volume = json['volume'] ?? '';
    final fileName = json['fileName'] ?? '';
    final locale = json['locale'] ?? '';
    final createdAt = json['createdAt'] ?? '';
    final updatedAt = json['updatedAt'] ?? '';
    final version = json['version'] ?? 0;

    return Attributes(
        description: description,
        volume: volume,
        fileName: fileName,
        locale: locale,
        createdAt: createdAt,
        updatedAt: updatedAt,
        version: version);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['volume'] = volume;
    data['fileName'] = fileName;
    data['locale'] = locale;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['version'] = version;
    return data;
  }
}
