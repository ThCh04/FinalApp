import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final Map<String, dynamic> news;

  NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(news['title']['rendered']),
        subtitle: Text(news['excerpt']['rendered']),
        onTap: () {
          // Lógica para manejar la interacción con la noticia
        },
      ),
    );
  }
}