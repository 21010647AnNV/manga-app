part of 'chapter_screen_bloc.dart';

abstract class ChapterScreenEvent extends Equatable {
  const ChapterScreenEvent();

  @override
  List<Object> get props => [];
}

class ChapterScreenGetListChapter extends ChapterScreenEvent {
  final String id;

  const ChapterScreenGetListChapter({required this.id});
  @override
  List<Object> get props => [id];
}

class ChapterScreenGetOneChapter extends ChapterScreenEvent {
  final String id;

  const ChapterScreenGetOneChapter({required this.id});
  @override
  List<Object> get props => [id];
}
