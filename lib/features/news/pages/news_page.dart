import 'package:flutter/material.dart';

import '../../../core/models/newss.dart';
import '../../../core/widgets/appbar.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Appbar(title: 'News'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              itemCount: newssList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  if (index == 0) const SizedBox(height: 20),
                  NewsCard(newss: newssList[index]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
