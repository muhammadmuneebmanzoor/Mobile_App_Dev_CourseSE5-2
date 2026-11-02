import 'package:flutter/material.dart';
import 'detail_page.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final albumImages = [
      {'path': 'images/banner.png', 'tag': 'album-1'},
      {'path': 'images/banner for amazon linkdin.png', 'tag': 'album-2'},
      {'path': 'images/banner 2.png', 'tag': 'album-3'},
      {'path': 'images/banner 3.png', 'tag': 'album-4'},
      {'path': 'images/banner 4.png', 'tag': 'album-5'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Memories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: albumImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final item = albumImages[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      imagePath: item['path']!,
                      tag: item['tag']!,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Hero(
                  tag: item['tag']!,
                  child: Image.asset(
                    item['path']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}