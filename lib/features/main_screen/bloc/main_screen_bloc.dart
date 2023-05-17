import 'package:comic_app/features/main_screen/repositories/main_screen_repo.dart';
import 'package:comic_app/model/covers/cover.dart';
import 'package:comic_app/model/manga/manga.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenRepository mainScreenRepository;
  MainScreenBloc({required this.mainScreenRepository})
      : super(MainScreenInitial()) {
    on<MainScreenGetListMangaPost>(_getListMangaPost);
    on<MainScreenGetFileNameOneManga>(_getFileNameOneManga);
  }

  Future<void> _getListMangaPost(
      MainScreenGetListMangaPost event, Emitter<MainScreenState> emit) async {
    try {
      MangaModel mangaModel =
          await mainScreenRepository.fetchListPostMangaAPI();
      emit(MainScreenGetMangaPostSuccess(mangaModel: mangaModel));
    } catch (e) {
      emit(MainScreenError(error: e.toString()));
    }
  }

  Future<void> _getFileNameOneManga(MainScreenGetFileNameOneManga event,
      Emitter<MainScreenState> emit) async {
    try {
      OneManga oneManga =
          await mainScreenRepository.fetchFileNameOfCoverAPI(id: event.id);
      emit(MainScreenGetFileNameOneMangaPostSuccess(oneManga: oneManga));
    } catch (e) {
      emit(MainScreenError(error: e.toString()));
    }
  }
}
