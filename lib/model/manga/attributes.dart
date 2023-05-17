import 'package:comic_app/model/manga/description.dart';
import 'package:comic_app/model/manga/title.dart';

import 'link.dart';

class Attributes {
  final Title title;
  final Description description;
  final Links links;
  final String lastVolume;
  final String lastChapter;
  final String publicationDemographic;
  final String status;
  final int year;
  final String contentRating;
  final String state;
  final String createdAt;
  final String updatedAt;
  final int version;
  final String latestUploadedChapter;

  Attributes(
      {required this.title,
      required this.description,
      required this.links,
      required this.lastVolume,
      required this.lastChapter,
      required this.publicationDemographic,
      required this.status,
      required this.year,
      required this.contentRating,
      required this.state,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.latestUploadedChapter});

  factory Attributes.fromJson(Map<String, dynamic> json) {
    final Title title;
    if (json['title'] != null) {
      title = Title.fromJson(json['title']);
    } else {
      title = Title(en: '');
    }

    final Description description;
    if (json['description'] != null) {
      description = Description.fromJson(json['description']);
    } else {
      description = Description(en: '');
    }

    final Links links;
    if (json['links'] != null) {
      links = Links.fromJson(json['links']);
    } else {
      links = Links(amz: '');
    }

    final lastVolume = json['lastVolume'] ?? '';
    final lastChapter = json['lastChapter'] ?? '';
    final publicationDemographic = json['publicationDemographic'] ?? '';
    final status = json['status'] ?? '';
    final year = json['year'] ?? 0;
    final contentRating = json['contentRating'] ?? '';
    final state = json['state'] ?? '';
    final createdAt = json['createdAt'] ?? '';
    final updatedAt = json['updatedAt'] ?? '';
    final version = json['version'] ?? 0;
    final latestUploadedChapter = json['latestUploadedChapter'] ?? '';

    return Attributes(
        title: title,
        description: description,
        links: links,
        lastVolume: lastVolume,
        lastChapter: lastChapter,
        publicationDemographic: publicationDemographic,
        status: status,
        year: year,
        contentRating: contentRating,
        state: state,
        createdAt: createdAt,
        updatedAt: updatedAt,
        version: version,
        latestUploadedChapter: latestUploadedChapter);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title.toJson();
    data['description'] = description.toJson();
    data['links'] = links.toJson();
    data['lastVolume'] = lastVolume;
    data['lastChapter'] = lastChapter;
    data['publicationDemographic'] = publicationDemographic;
    data['status'] = status;
    data['year'] = year;
    data['contentRating'] = contentRating;
    data['state'] = state;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['version'] = version;
    data['latestUploadedChapter'] = latestUploadedChapter;
    return data;
  }
}
