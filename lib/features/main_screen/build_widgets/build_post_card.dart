import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_app/features/chapter_screen/ui/chapter_screen.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String updateAt;
  final String id;

  const PostCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.updateAt,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffB6EAFA),
            shadowColor: Colors.transparent,
            foregroundColor: const Color(0xff19A7CE)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChapterScreen(
                        id: id,
                        title: title,
                      )));
        },
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              updateAt,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
