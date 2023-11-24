/*
import 'package:flutter/material.dart';
class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);
  @override
  _BookPageState createState() => _BookPageState();
}
class _BookPageState extends State<BookPage> {
  List<Book> books = [
    Book(title: 'Harry Potter e a Pedra Filosofal', author: 'J.K. Rowling', genre: 'Fantasia', year: 1997, cover: 'https://upload.wikimedia.org/wikipedia/en/thumb/6/64/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg/220px-Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg'),
    Book(title: 'O Senhor dos Anéis: A Sociedade do Anel', author: 'J.R.R. Tolkien', genre: 'Fantasia', year: 1954, cover: 'https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/The_Lord_of_the_Rings_1st_edition_dust_jacket.jpg/220px-The_Lord_of_the_Rings_1st_edition_dust_jacket.jpg'),
    Book(title: 'O Alquimista', author: 'Paulo Coelho', genre: 'Autoajuda', year: 1988, cover: 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/The_Alchemist_cover.jpg/220px-The_Alchemist_cover.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livros'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(books[index].cover),
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
          );
        },

 
*/