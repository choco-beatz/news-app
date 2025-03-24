import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kalpas_machine_test/constant/colors.dart';
import 'package:kalpas_machine_test/constant/text.dart';
import 'package:kalpas_machine_test/controller/controller.dart';
import 'package:kalpas_machine_test/model/news_model.dart';
import 'package:kalpas_machine_test/view/details_screen/details_screen.dart';
import 'package:kalpas_machine_test/view/home_screen/widgets/news_cards.dart';
import 'package:kalpas_machine_test/view/widgets/empty.dart';
import 'package:kalpas_machine_test/view/widgets/loading.dart';

class Favs extends StatelessWidget {
  const Favs({
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

      if (newsController.favsList.isEmpty) {
        return const Empty();
      }

      return SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
          itemCount: newsController.favsList.length,
          itemBuilder: (context, index) {
            final fav = newsController.favsList[index];

            // Find the matching article in the news list
            final article = newsController.newsList.firstWhere(
              (item) => item.title == fav.title,
              orElse: () => Articles(), // Return empty if not found
            );
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
                        _deleteFromFavs(index);
                        Slidable.of(context)?.close();
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: red,
                            size: 30,
                          ),
                          Text12(
                            title: 'Delete from Favorite',
                            isBlack: true,
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                  ]),
                  child: InkWell(
                      onTap: () => Get.to(() => DetailsScreen(
                            article: article,
                            isFav: true,
                          )),
                      child: NewsCard(article: article))),
            );
          },
        ),
      );
    });
  }

  void _deleteFromFavs(int index) {
    newsController.removeFavs(index);
  }
}
