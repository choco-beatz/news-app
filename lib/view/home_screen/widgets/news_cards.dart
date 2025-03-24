
import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/constant/colors.dart';
import 'package:kalpas_machine_test/constant/text.dart';
import 'package:kalpas_machine_test/model/news_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.article,
  });

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.none,
        surfaceTintColor: white,
        elevation: 20,
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              article.urlToImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: 90,
                        width: 90,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(article.urlToImage!,
                              fit: BoxFit.cover),
                        ),
                      ),
                    )
                  : const Icon(Icons.image),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text14(
                        title: article.title ?? '',
                        isBold: true,
                      ),
                      Text14(title: article.description ?? ''),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            LucideIcons.calendarClock,
                            color: darkGrey,
                          ),
                          Text12(
                              title: formatPublishedDate(
                                  article.publishedAt ?? '')),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
