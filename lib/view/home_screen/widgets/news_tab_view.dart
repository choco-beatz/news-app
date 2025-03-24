import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:kalpas_machine_test/constant/colors.dart';
import 'package:kalpas_machine_test/constant/text.dart';
import 'package:kalpas_machine_test/controller/controller.dart';
import 'package:kalpas_machine_test/model/favs_hive_model.dart';
import 'package:kalpas_machine_test/view/details_screen/details_screen.dart';
import 'package:kalpas_machine_test/view/home_screen/widgets/news_cards.dart';
import 'package:kalpas_machine_test/view/widgets/empty.dart';
import 'package:kalpas_machine_test/view/widgets/loading.dart';

class News extends StatelessWidget {
  const News({
    super.key,
    required this.newsController,
  });

  final Controller newsController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (newsController.isLoading.value) {
        return const Loading();
      }

      if (newsController.newsList.isEmpty) {
        return const Empty();
      }

      return SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
          itemCount: newsController.newsList.length,
          itemBuilder: (context, index) {
            final article = newsController.newsList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slidable(
                  key: Key(article.title ?? index.toString()),
                  endActionPane:
                      ActionPane(motion: const BehindMotion(), children: [
                    CustomSlidableAction(
                      backgroundColor: lightRed,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      onPressed: (context) {
                        _addtoFavs(article.title!);
                        Slidable.of(context)?.close();
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: red,
                            size: 30,
                          ),
                          Text12(
                            title: 'Add to Favorite',
                            isBlack: true,
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                  ]),
                  child: InkWell(
                      onTap: () =>
                          Get.to(() => DetailsScreen(article: article)),
                      child: NewsCard(article: article))),
            );
          },
        ),
      );
    });
  }

  void _addtoFavs(String title) {
    newsController.addToFavs(FavsModel(title: title));
  }
}
