import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/constant/colors.dart';
import 'package:kalpas_machine_test/constant/space.dart';
import 'package:kalpas_machine_test/constant/text.dart';
import 'package:kalpas_machine_test/model/news_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.article, this.isFav = false});

  final Articles article;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width * 0.25,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              hSpace,
              Icon(
                Icons.chevron_left,
                size: 40,
              ),
              Text12(
                isBlack: true,
                title: 'Back',
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                article.urlToImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          height: width * 0.5,
                          width: width,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(article.urlToImage!,
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                            height: width * 0.5,
                            width: width,
                            child: const AspectRatio(
                                aspectRatio: 1, child: Icon(Icons.image)))),
                Positioned(
                    top: width * 0.025,
                    right: width * 0.025,
                    child: isFav
                        ? const Icon(
                            Icons.favorite,
                            color: red,
                            size: 34,
                          )
                        : SizedBox.shrink())
              ]),
              space,
              Text28(
                title: article.title ?? '',
              ),
              space,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    LucideIcons.calendarClock,
                    color: darkGrey,
                    size: 20,
                  ),
                  Text12(title: formatPublishedDate(article.publishedAt ?? '')),
                ],
              ),
              space,
              Text14(isMultiLine: true, title: article.content ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
