import 'package:comic_app/features/chapter_screen/ui/reading_screen.dart';
import 'package:flutter/material.dart';

class BuildChapter extends StatelessWidget {
  final String chapter;
  final String title;
  final String id;
  const BuildChapter(
      {super.key,
      required this.chapter,
      required this.title,
      required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xff19A7CE)),
        width: size.width,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReadingScreen(
                          chapter: chapter,
                          id: id,
                        )));
          },
          child: Center(
            child: Text(
              'Chapter $chapter: $title',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
