import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://remolacha.net/wp-json/wp/v2/posts?search=digeset';

  Future<List<Map<String, dynamic>>> fetchNews() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Error al cargar las noticias');
    }
  }
}