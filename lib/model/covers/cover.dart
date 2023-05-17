import 'package:comic_app/model/covers/data.dart';

class OneManga {
  final Data data;

  OneManga({required this.data});

  factory OneManga.fromJson(Map<String, dynamic> json) {
    final data = Data.fromJson(json['data']);
    return OneManga(data: data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.toJson();

    return data;
  }
}
