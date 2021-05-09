import 'dart:convert';
import 'blog_model.dart';
import 'package:http/http.dart' as http;

class BlogApi {
  static Future<List<Blog>> getBlog() async {
    var url = Uri.parse(
        "https://raw.githubusercontent.com/Muhaiminur/muhaiminur.github.io/master/misfitflutter.tech");

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return Blog.toList(jsonData['blogs']);

    // jsonData["blogs"].forEach((element) {
    //   Blog blog = Blog(
    //     title: element['title'],
    //     description: element['description'],
    //     coverphoto: element['cover_photo'],
    //   );
    //   blog.add(Blog);
    // });
  }
}
