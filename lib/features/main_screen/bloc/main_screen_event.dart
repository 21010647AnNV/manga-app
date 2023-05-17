part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();

  @override
  List<Object> get props => [];
}

class MainScreenGetListMangaPost extends MainScreenEvent {}

class MainScreenGetFileNameOneManga extends MainScreenEvent {
  final String id;

  const MainScreenGetFileNameOneManga({required this.id});
  @override
  List<Object> get props => [id];
}
