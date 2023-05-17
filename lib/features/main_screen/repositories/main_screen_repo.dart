import 'dart:developer';

import 'dart:convert';

import 'package:comic_app/model/covers/big_attribute.dart';
import 'package:comic_app/model/covers/cover.dart';
import 'package:comic_app/model/covers/data.dart';
import 'package:comic_app/model/manga/manga.dart';
import 'package:http/http.dart' as http;

class MainScreenRepository {
  final String baseUrl = 'https://api.mangadex.org/manga';

  Future<MangaModel> fetchListPostMangaAPI() async {
    try {
      MangaModel mangaModel = MangaModel(
          listData: [],
          limit: 1,
          offset: 1,
          response: '',
          result: '',
          total: 2);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        mangaModel = MangaModel.fromJson(jsonResponse);
      } else {
        log(response.statusCode.toString());
      }
      return mangaModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<OneManga> fetchFileNameOfCoverAPI({required String id}) async {
    try {
      OneManga oneManga = OneManga(
          data: Data(
              id: '',
              relationships: [],
              bigAttributes: BigAttributes(title: Title(en: ''))));
      final response =
          await http.get(Uri.parse('$baseUrl/$id?includes[]=cover_art'));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        oneManga = OneManga.fromJson(jsonResponse);
      } else {
        log(response.statusCode.toString());
      }
      log(oneManga.data.relationships[0].attributes.fileName);
      return oneManga;
    } catch (e) {
      throw Exception(e);
    }
  }
}
