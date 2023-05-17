class BigAttributes {
  final Title title;

  BigAttributes({required this.title});

  factory BigAttributes.fromJson(Map<String, dynamic> json) {
    final title = Title.fromJson(json['title']);

    return BigAttributes(title: title);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title.toJson();

    return data;
  }
}

class Title {
  final String en;

  Title({required this.en});

  factory Title.fromJson(Map<String, dynamic> json) {
    final en = json['en'] ?? '';

    return Title(en: en);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}
