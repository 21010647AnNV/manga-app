class Description {
  final String en;

  Description({required this.en});

  factory Description.fromJson(Map<String, dynamic> json) {
    final en = json['en'] ?? '';

    return Description(en: en);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;

    return data;
  }
}
