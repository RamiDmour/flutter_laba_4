import 'package:flutter/material.dart';
import 'package:flutter_laba_4/responses/get_news_response.dart';

class ArticleItem extends StatelessWidget {
  final Function() onTap;
  final Article article;
  const ArticleItem({
    super.key,
    required this.article,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              child: Image.network(article.urlToImage),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(article.description),
              ],
            ),
          )
        ],
      ),
    );
  }
}
