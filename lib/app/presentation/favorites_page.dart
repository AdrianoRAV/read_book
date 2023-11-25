import 'package:flutter/material.dart';
import 'package:read_book/app/book_details_page.dart';
import 'package:read_book/app/presentation/details_page.dart';

class FavoritesPage extends StatelessWidget {
  final List<Book> books;

  FavoritesPage(this.books);

  @override
  Widget build(BuildContext context) {
    List<Book> favoriteBooks = books.where((book) => book.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          Book book = favoriteBooks[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            leading: Image.network(
              book.coverUrl,
              width: 50.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            onTap: () {
              BookDetailsPage(book);
              print('Livro selecionado: ${book.title}');
            },
          );
        },
      ),
    );
  }
}
