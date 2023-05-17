class OneChapterModel {
  final String baseUrl;
  final Chapter chapter;

  OneChapterModel({required this.baseUrl, required this.chapter});

  factory OneChapterModel.fromJson(Map<String, dynamic> json) {
    final baseUrl = json['baseUrl'];
    final chapter = Chapter.fromJson(json['chapter']);

    return OneChapterModel(baseUrl: baseUrl, chapter: chapter);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['baseUrl'] = baseUrl;
    data['chapter'] = chapter.toJson();
    return data;
  }
}

class Chapter {
  final String hash;
  final List<String> data;
  final List<String> dataSaver;

  Chapter({required this.hash, required this.data, required this.dataSaver});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    final hash = json['hash'] ?? '';
    final data = json['data'].cast<String>() ?? [];
    final dataSaver = json['dataSaver'].cast<String>() ?? [];

    return Chapter(hash: hash, data: data, dataSaver: dataSaver);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hash'] = hash;
    data['data'] = data;
    data['dataSaver'] = dataSaver;
    return data;
  }
}
