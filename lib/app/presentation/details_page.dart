import 'package:flutter/material.dart';
import 'package:read_book/app/book_details_page.dart';

class BookDownload extends StatelessWidget {
  const BookDownload({
    super.key,
    required this.book,
    required this.context,
  });

  final Book book;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              book.coverUrl,
              width: 100.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text('Author: ${book.author}'),
            SizedBox(height: 8.0),
            Text('Download URL: ${book.downloadUrl}'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Download'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Abrir Leitor: ${book.title}');
                  },
                  child: Text('Ler'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
