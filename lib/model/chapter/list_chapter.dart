import 'package:comic_app/model/chapter/data.dart';

class Chapters {
  final List<Data> data;

  Chapters({
    required this.data,
  });

  factory Chapters.fromJson(Map<String, dynamic> json) {
    final data = <Data>[];
    json['data'].forEach((v) {
      data.add(Data.fromJson(v));
    });

    return Chapters(data: data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['data'] = this.data.map((v) => v.toJson()).toList();

    return data;
  }
}
