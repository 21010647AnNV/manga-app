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
