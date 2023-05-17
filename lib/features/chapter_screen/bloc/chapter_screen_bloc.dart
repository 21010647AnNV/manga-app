import 'package:comic_app/features/chapter_screen/repository/chapter_repo.dart';
import 'package:comic_app/model/chapter/list_chapter.dart';
import 'package:comic_app/model/one_chapter/one_chapter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chapter_screen_event.dart';
part 'chapter_screen_state.dart';

class ChapterScreenBloc extends Bloc<ChapterScreenEvent, ChapterScreenState> {
  ChapterRepository chapterRepository;
  ChapterScreenBloc({required this.chapterRepository})
      : super(ChapterScreenInitial()) {
    on<ChapterScreenGetListChapter>(_getFileNameOneManga);
    on<ChapterScreenGetOneChapter>(_getOneChapter);
  }

  Future<void> _getFileNameOneManga(ChapterScreenGetListChapter event,
      Emitter<ChapterScreenState> emit) async {
    try {
      Chapters chapters =
          await chapterRepository.fetchListChapterAPI(id: event.id);
      emit(ChapterScreenGetListChapterSuccess(chapters: chapters));
    } catch (e) {
      emit(ChapterScreenError(error: e.toString()));
    }
  }

  Future<void> _getOneChapter(ChapterScreenGetOneChapter event,
      Emitter<ChapterScreenState> emit) async {
    try {
      OneChapterModel oneChapterModel =
          await chapterRepository.fetchOneImage(id: event.id);
      emit(ChapterScreenOneChapterSuccess(oneChapterModel: oneChapterModel));
    } catch (e) {
      emit(ChapterScreenError(error: e.toString()));
    }
  }
}
