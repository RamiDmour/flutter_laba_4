import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_laba_4/pages/article_page.dart';
import 'package:flutter_laba_4/responses/get_news_response.dart';
import 'package:flutter_laba_4/widgets/article_item.dart';
import 'package:http/http.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<Article> news = [];
  var isLoading = false;
  @override
  void initState() {
    fetchNews();
    super.initState();
  }

  fetchNews() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await get(Uri.parse("https://newsapi.org/v2/top-headlines?country=ru&apiKey=50506c845b0d40a99133293feb9684c9"));
    setState(() {
      news = GetNewsResponse.fromJson(response.body).articles;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => fetchNews(),
                child: ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (_, i) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ArticleItem(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ArticlePage(
                            articleUrl: news[i].url,
                          ),
                        ),
                      ),
                      article: news[i],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
