import 'dart:convert';
import 'package:flutter_rest_api/post.dart';
import 'package:http/http.dart' as http;

class RestRepository {


  Future<List<Post>>fetchPosts()async{ 
  final response =
     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if( response.statusCode==200){
    List<dynamic> jsonPosts=json.decode(response.body);
    List<Post> posts=jsonPosts.map((json) => Post.fromJson(json)).toList();
    return posts;
  }else{
    throw Exception('Erreur de chargement');
  }
  }




Future<Post> createPost (Post post) async {
  final response = await http.post(
  Uri. parse('https://jsonplaceholder.typicode.com/posts'),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode (post. toJson()),
  );
if (response. statusCode == 201) {
  return Post. fromJson (json. decode (response. body));
} else
  throw Exception('Erreur de création');
}


Future<void> updatePost (Post post) async {
  final response = await http.put (
  Uri. parse('https://jsonplaceholder.typicode.com/posts/${post.id}'),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode (post. toJson()),
  );
  if (response. statusCode != 200) {
    throw Exception('Erreur de mise à jour');
}
}


Future<void> deletePost(int id) async {
  final response = await http
        .delete(Uri. parse( 'https://jsonplaceholder.typicode.com/posts/$id'));
  if(response.statusCode != 200) {
  throw Exception('Erreur de suppression');
}

}
}