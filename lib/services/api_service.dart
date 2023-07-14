import 'package:dio/dio.dart';
import 'package:flutter_crud/models/post_model.dart';

// 'https://jsonplaceholder.typicode.com/posts'

class ApiService {
  final Dio dio;
  final String endpoint = "https://jsonplaceholder.typicode.com";

  ApiService() : dio = Dio();

  Future<Post> getPost(int id) async {
    final String url = "$endpoint/posts/$id";
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final post = Post.fromJson(response.data);
        return post;
      } else {
        throw Exception('Request failed with status ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
}
