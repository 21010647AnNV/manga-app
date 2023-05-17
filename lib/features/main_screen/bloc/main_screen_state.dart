part of 'main_screen_bloc.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {}

class MainScreenGetMangaPostSuccess extends MainScreenState {
  final MangaModel mangaModel;

  const MainScreenGetMangaPostSuccess({required this.mangaModel});

  @override
  List<Object> get props => [mangaModel];
}

class MainScreenGetFileNameOneMangaPostSuccess extends MainScreenState {
  final OneManga oneManga;

  const MainScreenGetFileNameOneMangaPostSuccess({required this.oneManga});

  @override
  List<Object> get props => [oneManga];
}

class MainScreenError extends MainScreenState {
  final String error;

  const MainScreenError({required this.error});

  @override
  List<Object> get props => [error];
}
