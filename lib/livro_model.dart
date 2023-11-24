class LivroModel {
  String? id;
  String? title;
  String? author;
  String? cover_url;
  String? download_url;

  LivroModel({
    this.id,
    this.title,
    this.author,
    this.cover_url,
    this.download_url,
  });

  factory LivroModel.fromMap(Map<String, dynamic> map) {
    return LivroModel(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      cover_url: map['cover_url'],
      download_url: map['download_url'],
    );
  }
}
