// import 'dart:developer';
import 'package:comic_app/model/manga/data.dart';

class MangaModel {
  final String result;
  final String response;
  final List<Data> listData;
  final int limit;
  final int offset;
  final int total;

  MangaModel(
      {required this.result,
      required this.response,
      required this.listData,
      required this.limit,
      required this.offset,
      required this.total});

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    final result = json['result'] ?? '';
    final response = json['response'] ?? '';

    final listData = <Data>[];
    json['data'].forEach((v) {
      listData.add(Data.fromJson(v));
    });

    final limit = json['limit'] ?? 0;
    final offset = json['offset'] ?? 0;
    final total = json['total'] ?? 0;
    return MangaModel(
        result: result,
        response: response,
        listData: listData,
        limit: limit,
        offset: offset,
        total: total);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['response'] = response;

    data['data'] = listData.map((v) => v.toJson()).toList();

    data['limit'] = limit;
    data['offset'] = offset;
    data['total'] = total;
    return data;
  }
}
