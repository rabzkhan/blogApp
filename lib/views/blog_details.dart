import 'package:flutter/material.dart';

import '../api/blog_model.dart';

class BlogDetails extends StatelessWidget {
  final Blog blog;
  const BlogDetails({Key key, this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Blog Details',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Stack(
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                        image: NetworkImage(blog.coverPhoto),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    left: 10.0,
                    bottom: -40.0,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(blog.author.avatar),
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(blog.author.name),
              subtitle: Text(blog.author.profession),
            ),
            Text(
              blog.title,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Text(blog.description,
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(
              height: 8,
            ),
            Text(blog.categories[0],
                style: TextStyle(fontSize: 14, color: Colors.black87)),
            Text(blog.categories[1],
                style: TextStyle(fontSize: 14, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
