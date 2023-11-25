import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:read_book/app/book_details_page.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  BookDetailsPage(this.book);

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
      } else {
        print('Erro: Diretório externo nulo');
      }
    } catch (e) {
      print('Erro durante o download: $e');
    }
  }

  Future<String> getDownloadDirectory(String bookTitle) async {
    try {
      Directory? appDocDir = await getExternalStorageDirectory();
      if (appDocDir == null) {
        throw 'Não foi possível obter o diretório externo de armazenamento.';
      }

      String appDocPath = appDocDir.path;
      String savePath = '$appDocPath/$bookTitle.epub';

      // Verificar se o diretório de download existe, senão criar
      if (!await Directory(appDocPath).exists()) {
        await Directory(appDocPath).create(recursive: true);
      }

      return savePath;
    } catch (e) {
      print('Erro ao obter diretório de download: $e');
      throw e;
    }
  }

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
                  onPressed: _downloadBook,
                  child: Text('Download'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica para abrir o leitor de EPUB aqui
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
