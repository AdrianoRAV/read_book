// pages/reader_page.dart

import 'package:flutter/material.dart';
//import 'package:vocsy_epub_viewer/vocsy_epub_viewer.dart';

class ReaderPage extends StatelessWidget {
  final String bookPath; // Caminho do livro baixado

  ReaderPage({required this.bookPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leitura do Livro'),
      ),
     // body: EpubViewer(path: bookPath),
    );
  }
}
