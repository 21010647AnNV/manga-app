part of 'chapter_screen_bloc.dart';

abstract class ChapterScreenState extends Equatable {
  const ChapterScreenState();

  @override
  List<Object> get props => [];
}

class ChapterScreenInitial extends ChapterScreenState {}

class ChapterScreenGetListChapterSuccess extends ChapterScreenState {
  final Chapters chapters;

  const ChapterScreenGetListChapterSuccess({required this.chapters});

  @override
  List<Object> get props => [chapters];
}

class ChapterScreenOneChapterSuccess extends ChapterScreenState {
  final OneChapterModel oneChapterModel;

  const ChapterScreenOneChapterSuccess({required this.oneChapterModel});

  @override
  List<Object> get props => [OneChapterModel];
}

class ChapterScreenError extends ChapterScreenState {
  final String error;

  const ChapterScreenError({required this.error});

  @override
  List<Object> get props => [error];
}
