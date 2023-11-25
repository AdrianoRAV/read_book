/*import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:read_book/app/book_details_page.dart';
import 'package:vocsy_epub_viewer/vocsy_epub_viewer.dart';

class BookDetailsPag extends StatelessWidget {
  final Book book;

  BookDetailsPag(this.book);

  Future<void> _downloadBook() async {
    Dio dio = Dio();

    try {
      Directory? appDocDir = await getExternalStorageDirectory();
      if (appDocDir != null) {
        String savePath = appDocDir.path + '/${book.title}.epub';

        var response = await dio.download(
          book.downloadUrl,
          savePath,
          onReceiveProgress: (received, total) {
            print('Received: $received, Total: $total');
          },
        );
        print('Download completo: $response');

        // Após o download, abra o leitor EPUB
        _openEpubViewer(savePath);
      } else {
        print('Erro: Diretório externo nulo');
      }
    } catch (e) {
      print('Erro durante o download: $e');
    }
  }

  Future<void> _openEpubViewer(String filePath) async {
    try {
      //await VocsyEpubViewer.open(filePath);
    } catch (e) {
      print('Erro ao abrir o leitor EPUB: $e');
    }
  }

  // Restante do código...
}
*/