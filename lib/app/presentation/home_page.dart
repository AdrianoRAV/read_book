import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:read_book/app/book_details_page.dart';
import 'package:read_book/app/presentation/details_page.dart';
import 'package:read_book/app/presentation/favorites_page.dart';

/*
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      final response =
          await http.get(Uri.parse('https://escribo.com/books.json'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          books = jsonData.map((bookData) => Book.fromJson(bookData)).toList();
        });
      } else {
        print(
            'Falha ao carregar os dados do JSON. Código de status: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao carregar os dados do JSON: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: buildBookList(),
    );
  }

  Widget buildBookList() {
    if (books.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return buildBookCard(books[index]);
        },
      );
    }
  }

  Widget buildBookCard(Book book) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        title: Text(book.title),
        subtitle: Text(book.author),
        leading: Image.network(
          book.coverUrl,
          width: 50.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsPage(book),
            ),
          );
          // Adicione aqui a ação que você deseja realizar ao tocar em um livro
          print('Livro selecionado: ${book.title}');
        },
      ),
    );
  }
}
*/

/*
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      final response =
          await http.get(Uri.parse('https://escribo.com/books.json'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          books = jsonData.map((bookData) => Book.fromJson(bookData)).toList();
        });
      } else {
        print(
            'Falha ao carregar os dados do JSON. Código de status: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao carregar os dados do JSON: $error');
    }
  }

  void _toggleFavorite(Book book) {
    setState(() {
      book.isFavorite = !book.isFavorite;
    });
  }

  Widget buildBookCard(Book book) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        title: Text(book.title),
        subtitle: Text(book.author),
        leading: Image.network(
          book.coverUrl,
          width: 50.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        trailing: IconButton(
          icon: Icon(
            book.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: book.isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            _toggleFavorite(book);
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsPage(book),
            ),
          );
          // BookDetailsPage(book);
          print('Livro selecionado: ${book.title}');
        },
      ),
    );
  }

  Widget buildBookList() {
    if (books.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return buildBookCard(books[index]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: buildBookList(),
    );
  }
}
*/

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      final response =
          await http.get(Uri.parse('https://escribo.com/books.json'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          books = jsonData.map((bookData) => Book.fromJson(bookData)).toList();
        });
      } else {
        print(
            'Falha ao carregar os dados do JSON. Código de status: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao carregar os dados do JSON: $error');
    }
  }

  void _toggleFavorite(Book book) {
    setState(() {
      book.isFavorite = !book.isFavorite;
    });
  }

  Widget buildBookCard(Book book) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        title: Text(book.title),
        subtitle: Text(book.author),
        leading: Image.network(
          book.coverUrl,
          width: 50.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        trailing: IconButton(
          icon: Icon(
            book.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: book.isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            _toggleFavorite(book);
          },
        ),
        onTap: () {
          /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsPage(book),
            ),
          );*/
          BookDetailsPage(book);
          print('Livro selecionado: ${book.title}');
        },
      ),
    );
  }

  Widget buildBookList() {
    if (books.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return buildBookCard(books[index]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: buildBookList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesPage(books),
            ),
          );
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
