import 'dart:developer';

import 'dart:convert';
import 'package:comic_app/model/chapter/list_chapter.dart';
import 'package:comic_app/model/one_chapter/one_chapter.dart';
import 'package:http/http.dart' as http;

class ChapterRepository {
  final String baseUrl = 'https://api.mangadex.org/manga';

  Future<Chapters> fetchListChapterAPI({required String id}) async {
    try {
      Chapters chapters = Chapters(data: []);
      final response = await http.get(Uri.parse('$baseUrl/$id/feed'));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        chapters = Chapters.fromJson(jsonResponse);
      } else {
        log(response.statusCode.toString());
      }
      return chapters;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<OneChapterModel> fetchOneImage({required String id}) async {
    try {
      OneChapterModel oneChapterModel = OneChapterModel(
          baseUrl: '', chapter: Chapter(hash: '', data: [], dataSaver: []));
      final response = await http
          .get(Uri.parse('https://api.mangadex.org/at-home/server/$id'));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        oneChapterModel = OneChapterModel.fromJson(jsonResponse);
      } else {
        log(response.statusCode.toString());
      }
      return oneChapterModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
