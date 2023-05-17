import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_app/features/chapter_screen/repository/chapter_repo.dart';
import 'package:comic_app/model/chapter/list_chapter.dart';
import 'package:comic_app/model/one_chapter/one_chapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chapter_screen_bloc.dart';

class ReadingScreen extends StatefulWidget {
  final String chapter;
  final String id;
  const ReadingScreen({super.key, required this.chapter, required this.id});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  OneChapterModel oneChapterModel = OneChapterModel(
      baseUrl: '', chapter: Chapter(hash: '', data: [], dataSaver: []));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.chapter,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            ChapterScreenBloc(chapterRepository: ChapterRepository())
              ..add(ChapterScreenGetOneChapter(id: widget.id)),
        child: BlocBuilder<ChapterScreenBloc, ChapterScreenState>(
          builder: (context, state) {
            if (state is ChapterScreenOneChapterSuccess) {
              oneChapterModel = state.oneChapterModel;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: oneChapterModel.chapter.data.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://uploads.mangadex.org/data/${oneChapterModel.chapter.hash}/${oneChapterModel.chapter.data[index]}',
                          placeholder: (context, url) => Container(),
                          errorWidget: (context, url, error) =>
                              const Text('error'));
                    }),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
