import 'package:finalapp/widgets/mainDrawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/services/newsApi_service.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Map<String, dynamic>>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = _apiService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: AppBar(
        title: Text('Noticias Digeset'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al cargar las noticias'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No se encontraron noticias'),
            );
          } else {
            return NewsList(snapshot.data!);
          }
        },
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<Map<String, dynamic>> newsList;

  NewsList(this.newsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsCard(newsList[index]);
      },
    );
  }
}

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