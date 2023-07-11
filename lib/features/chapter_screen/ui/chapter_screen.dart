import 'package:comic_app/features/chapter_screen/build_widgets/build_chapter.dart';
import 'package:comic_app/features/chapter_screen/repository/chapter_repo.dart';
import 'package:comic_app/model/chapter/data.dart';
import 'package:comic_app/model/chapter/list_chapter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chapter_screen_bloc.dart';

class ChapterScreen extends StatefulWidget {
  final String id;
  final String title;
  const ChapterScreen({super.key, required this.id, required this.title});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  Chapters chapters = Chapters(data: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            ChapterScreenBloc(chapterRepository: ChapterRepository())
              ..add(ChapterScreenGetListChapter(id: widget.id)),
        child: BlocBuilder<ChapterScreenBloc, ChapterScreenState>(
          builder: (context, state) {
            if (state is ChapterScreenGetListChapterSuccess) {
              chapters = state.chapters;
              for (var i = 0; i < chapters.data.length - 1; i++) {
                for (var j = i + 1; j < chapters.data.length; j++) {
                  if (double.parse(chapters.data[i].attributes.chapter) >
                      double.parse(chapters.data[j].attributes.chapter)) {
                    Data data = chapters.data[i];
                    chapters.data[i] = chapters.data[j];
                    chapters.data[j] = data;
                  }
                }
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: chapters.data.length,
                    itemBuilder: (context, index) {
                      return BuildChapter(
                        chapter: chapters.data[index].attributes.chapter,
                        title: chapters.data[index].attributes.title,
                        id: chapters.data[index].id,
                      );
                    }),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
