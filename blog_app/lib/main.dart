import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlogListScreen(),
    );
  }
}

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  List<Blog> blogs = [];

  @override
  void initState() {
    super.initState();
    fetchBlogs();
  }

  Future<void> fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Parse the JSON response and update the 'blogs' list
        final List<dynamic> blogData = jsonDecode(response.body);
        setState(() {
          blogs = blogData.map((data) => Blog.fromJson(data)).toList();
        });
      } else {
        // Handle API error
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Explorer'),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          final blog = blogs[index];
          return ListTile(
            title: Text(blog.title),
            leading: Image.network(blog.imageUrl),
            onTap: () {
              // Navigate to the detailed blog view
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailScreen(blog: blog),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;

  const BlogDetailScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(blog.imageUrl),
            const SizedBox(height: 16.0),
            Text(blog.content),
          ],
        ),
      ),
    );
  }
}

class Blog {
  final String title;
  final String imageUrl;
  final String content;

  Blog({
    required this.title,
    required this.imageUrl,
    required this.content,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'],
      imageUrl: json['imageUrl'],
      content: json['content'],
    );
  }
}
