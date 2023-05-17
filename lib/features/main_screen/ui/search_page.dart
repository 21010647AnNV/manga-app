import 'dart:developer';

import 'package:comic_app/features/main_screen/build_widgets/build_post_card.dart';
import 'package:comic_app/model/manga/manga.dart';
import 'package:flutter/material.dart';

import '../../../model/covers/cover.dart';

class SearchPage extends StatefulWidget {
  final List<OneManga> listManga;
  const SearchPage({super.key, required this.listManga});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<OneManga> _listSearch = [];
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autofocus: true,
                controller: _searchController,
                onChanged: (value) {
                  log(value);
                  _listSearch.clear();
                  for (var items in widget.listManga) {
                    if (items.data.bigAttributes.title.en
                        .toLowerCase()
                        .contains(value.toLowerCase())) {
                      log(items.data.bigAttributes.title.en);
                      _listSearch.add(items);
                      setState(() {
                        _listSearch;
                      });
                    }
                  }
                },
              ),
            ),
            SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _listSearch.length,
                  itemBuilder: (context, index) {
                    return PostCard(
                      title: _listSearch[index].data.bigAttributes.title.en,
                      imageUrl:
                          'https://uploads.mangadex.org/covers/${_listSearch[index].data.id}/${_listSearch[index].data.relationships[0].attributes.fileName}',
                      updateAt: 'Updated at: ${_formatString(
                        _listSearch[index]
                            .data
                            .relationships[0]
                            .attributes
                            .updatedAt,
                      )}',
                      id: _listSearch[index].data.id,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  String _formatString(String input) {
    return input.substring(0, 10);
  }
}
