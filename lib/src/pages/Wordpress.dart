import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Wordpress extends StatefulWidget {
  const Wordpress({super.key});

  @override
  State<Wordpress> createState() => _WordpressState();
}

class _WordpressState extends State<Wordpress> {
  final String apiUrl = 'https://public-api.wordpress.com/wp/v2/sites/goodmorningaomori.wordpress.com/posts';
  bool isLoading = true;
  List<dynamic> posts = [];
  String siteLogoUrl = '';

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          posts = data;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WordPress News'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length >= 3 ? 3 : posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final title = post['title']['rendered'];
                final excerpt = post['excerpt']['rendered'];
                final link = post['link'];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (siteLogoUrl.isNotEmpty)
                          Center(
                            child: Image.network(siteLogoUrl, height: 100),
                          ),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          excerpt,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () => _launchURL(link),
                          child: const Text(
                            'Read More',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
