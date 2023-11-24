import 'dart:convert';
import 'dart:html';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:read_book/http_client.dart';

import 'package:read_book/livro_model.dart';

abstract class ILivroRepository {
  Future<List<LivroModel>> getLivro();
}

class LivroRepository implements ILivroRepository {
  final IHttpClient client;

  LivroRepository({required this.client});

  @override
  Future<List<LivroModel>> getLivro() async {
    final response = await client.get(
      url: 'https://dummyjson.com/products',
    );

    if (response.statusCode == 200) {
      final List<LivroModel> livros = [];

      final body = jsonDecode(response.body);

      body[''].map((item))
    }
  }
}


/*/app
    /presentation
        main.dart
        home_page.dart
        book_details_page.dart
        book_reader_page.dart
    /business
        book_manager.dart
        favorite_manager.dart
    /data
        api.dart
        local_storage.dart
        vocsy_epub_viewer.dart */