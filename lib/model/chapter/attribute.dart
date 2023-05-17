class Attributes {
  final String volume;
  final String chapter;
  final String title;
  final String translatedLanguage;
  final String publishAt;
  final String readableAt;
  final String createdAt;
  final String updatedAt;
  final int pages;
  final int version;

  Attributes(
      {required this.volume,
      required this.chapter,
      required this.title,
      required this.translatedLanguage,
      required this.publishAt,
      required this.readableAt,
      required this.createdAt,
      required this.updatedAt,
      required this.pages,
      required this.version});

  factory Attributes.fromJson(Map<String, dynamic> json) {
    final volume = json['volume'] ?? '';
    final chapter = json['chapter'] ?? '';
    final title = json['title'] ?? '';
    final translatedLanguage = json['translatedLanguage'] ?? '';
    final publishAt = json['publishAt'] ?? '';
    final readableAt = json['readableAt'] ?? '';
    final createdAt = json['createdAt'] ?? '';
    final updatedAt = json['updatedAt'] ?? '';
    final pages = json['pages'] ?? 0;
    final version = json['version'] ?? 0;

    return Attributes(
        volume: volume,
        chapter: chapter,
        title: title,
        translatedLanguage: translatedLanguage,
        publishAt: publishAt,
        readableAt: readableAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
        pages: pages,
        version: version);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['volume'] = volume;
    data['chapter'] = chapter;
    data['title'] = title;
    data['translatedLanguage'] = translatedLanguage;
    data['publishAt'] = publishAt;
    data['readableAt'] = readableAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['pages'] = pages;
    data['version'] = version;
    return data;
  }
}
