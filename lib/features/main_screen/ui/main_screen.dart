import 'package:comic_app/features/main_screen/bloc/main_screen_bloc.dart';
import 'package:comic_app/features/main_screen/build_widgets/build_post_card.dart';
import 'package:comic_app/features/main_screen/repositories/main_screen_repo.dart';
import 'package:comic_app/features/main_screen/ui/search_page.dart';
import 'package:comic_app/model/covers/cover.dart';
import 'package:comic_app/model/manga/manga.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MangaModel _mangaModel = MangaModel(
      listData: [], limit: 1, offset: 1, response: '', result: '', total: 2);

  final List<OneManga> _listOneMage = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: BlocProvider(
          create: (context) =>
              MainScreenBloc(mainScreenRepository: MainScreenRepository())
                ..add(MainScreenGetListMangaPost()),
          child: BlocListener<MainScreenBloc, MainScreenState>(
            listener: (context, state) {
              if (state is MainScreenGetFileNameOneMangaPostSuccess) {
                _listOneMage.add(state.oneManga);
              }
            },
            child: BlocBuilder<MainScreenBloc, MainScreenState>(
              builder: (context, state) {
                if (state is MainScreenGetMangaPostSuccess) {
                  _mangaModel = state.mangaModel;
                  for (var i = 0; i < _mangaModel.listData.length; i++) {
                    context.read<MainScreenBloc>().add(
                        MainScreenGetFileNameOneManga(
                            id: _mangaModel.listData[i].id));
                  }
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _listOneMage.length,
                        itemBuilder: (context, index) {
                          return PostCard(
                            title:
                                _listOneMage[index].data.bigAttributes.title.en,
                            imageUrl:
                                'https://uploads.mangadex.org/covers/${_listOneMage[index].data.id}/${_listOneMage[index].data.relationships[0].attributes.fileName}',
                            updateAt: 'Updated at: ${_formatString(
                              _listOneMage[index]
                                  .data
                                  .relationships[0]
                                  .attributes
                                  .updatedAt,
                            )}',
                            id: _listOneMage[index].data.id,
                          );
                        }),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                            listManga: _listOneMage,
                          )));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ))
      ],
      centerTitle: true,
      backgroundColor: const Color(0xff19A7CE),
      title: const Text(
        'Wibuh',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  String _formatString(String input) {
    return input.substring(0, 10);
  }
}
