import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/my_colors.dart';
import '../../../core/models/newss.dart';
import '../../../core/config/utilities.dart';
import '../../../core/widgets/appbar.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({
    super.key,
    required this.newss,
  });

  final Newss newss;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Appbar(title: 'News'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(26),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: CachedNetworkImage(
                    imageUrl: newss.url,
                    height: 200,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
                const SizedBox(height: 26),
                Text(
                  dateToString(newss.date),
                  style: const TextStyle(
                    color: MyColors.main,
                    fontSize: 16,
                    fontFamily: MyFonts.ns400,
                  ),
                ),
                const SizedBox(height: 26),
                Text(
                  newss.name,
                  style: const TextStyle(
                    color: MyColors.main,
                    fontSize: 24,
                    fontFamily: MyFonts.ns700,
                  ),
                ),
                const SizedBox(height: 26),
                Text(
                  newss.content,
                  style: const TextStyle(
                    color: MyColors.main,
                    fontSize: 18,
                    fontFamily: MyFonts.ns400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
