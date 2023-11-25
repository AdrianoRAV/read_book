import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_book/app/book_details_page.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  BookDetailsPage(this.book);

  Future<void> _downloadBook(BuildContext context) async {
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

        if (response.statusCode == 200) {
          await _openEpubViewer(context, savePath);
        } else {
          print('Erro ao baixar o arquivo EPUB: ${response.statusMessage}');
        }
      } else {
        print('Erro: Diretório externo nulo');
      }
    } catch (e) {
      print('Erro durante o download: $e');
    }
  }

  Future<void> _openEpubViewer(BuildContext context, String filePath) async {
    try {
      VocsyEpub.setConfig(
        themeColor: Theme.of(context).primaryColor,
        identifier: "bookReader",
        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
        allowSharing: true,
        enableTts: true,
        nightMode: true,
      );

      VocsyEpub.locatorStream.listen((locator) {
        print('LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
        // convert locator from string to json and save to your database to be retrieved later
      });

      Completer<void> completer = Completer<void>();

      VocsyEpub.open(
        filePath,
        lastLocation: EpubLocator.fromJson({
          "bookId": "2239",
          "href": "/OEBPS/ch06.xhtml",
          "created": 1539934158390,
          "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"},
        }),
      );

      VocsyEpub.locatorStream.first.then((locator) {
        completer.complete();
      });

      await completer.future;
    } catch (e) {
      print('Erro ao abrir o leitor EPUB: $e');
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
                  onPressed: () => _downloadBook(context),
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
