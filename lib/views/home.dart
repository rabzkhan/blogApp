import 'package:blog/api/api.dart';
import 'package:blog/api/blog_model.dart';
import 'package:blog/views/blog_details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // ignore: deprecated_member_use
  List<Blog> blogs = [];
  bool _loading;

  void initState() {
    super.initState();
    getBlog();
  }

  getBlog() async {
    setState(() {
      _loading = true;
    });
    BlogApi.getBlog().then((data) {
      blogs = data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // status bar color
        brightness: Brightness.light,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BlogApp',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    /// Blog
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: blogs.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogTile(blog: blogs[index]);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final Blog blog;

  BlogTile({@required this.blog});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BlogDetails(blog: blog)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                    image: NetworkImage(blog.coverPhoto), fit: BoxFit.cover),
              ),
            ),
            Text(
              blog.title,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
