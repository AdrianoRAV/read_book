import 'package:flutter/material.dart';
import 'package:read_book/app/presentation/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Livros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Book {
  final int id;
  final String title;
  final String author;
  final String coverUrl;
  final String downloadUrl;
  bool isFavorite; // Adicionada a propriedade isFavorite

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.downloadUrl,
    this.isFavorite = false, // Valor padrão é false
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      coverUrl: json['cover_url'],
      downloadUrl: json['download_url'],
    );
  }
}

class FavoriteManager {
  static List<Book> favorites = [];

  static void addFavorite(Book book) {
    favorites.add(book);
  }

  static void removeFavorite(Book book) {
    favorites.remove(book);
  }

  static bool isFavorite(Book book) {
    return favorites.contains(book);
  }
}

// Camada de apresentação

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final List<Book> _favorites = [];

  @override
  void initState() {
    super.initState();

    _loadFavorites();
  }

  void _loadFavorites() async {
    // Pega os favoritos do armazenamento local
    List<Book> favorites = FavoriteManager.favorites;

    setState(() {
      _favorites.clear();
      _favorites.addAll(favorites);
    });
  }

  void _toggleFavorite(Book book) {
    if (FavoriteManager.isFavorite(book)) {
      FavoriteManager.removeFavorite(book);
    } else {
      FavoriteManager.addFavorite(book);
    }

    setState(() {
      book.isFavorite = !book.isFavorite;
      if (book.isFavorite) {
        _favorites.add(book);
      } else {
        _favorites.remove(book);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Favoritos'),
        Expanded(
          child: ListView.builder(
            itemCount: _favorites.length,
            itemBuilder: (context, index) {
              Book book = _favorites[index];

              return ListTile(
                leading: Image.network(book.coverUrl),
                title: Text(book.title),
                subtitle: Text(book.author),
                trailing: IconButton(
                  icon: Icon(
                      book.isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: () => _toggleFavorite(book),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
