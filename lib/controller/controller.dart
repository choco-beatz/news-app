import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kalpas_machine_test/model/favs_hive_model.dart';
import 'package:kalpas_machine_test/model/news_model.dart';
import 'package:kalpas_machine_test/services/news_repository.dart';

class Controller extends GetxController {
  late Box<FavsModel> newsBox;
  var favsList = <FavsModel>[].obs;
  var newsList = <Articles>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() async {
    super.onInit();
    fetchNews();
    openBox();
    fetchFavsFromApi();
  }

  void openBox() async {
    newsBox = await Hive.openBox<FavsModel>('newsBox');
    loadFavs();
  }

  void loadFavs() {
    favsList.assignAll(newsBox.values.toList());
  }

  void addToFavs(FavsModel fav) {
   bool isDuplicate = favsList.any((element) => element.title == fav.title);

  if (!isDuplicate) {
    newsBox.add(fav);
    favsList.add(fav);
    Get.snackbar('Added', 'News added to favorites!');
  } else {
    Get.snackbar('Oops!', 'This news is already in your favorites!');
  }}

  void removeFavs(int index) {
    newsBox.deleteAt(index);
    favsList.removeAt(index);
    Get.snackbar('Deleted', 'News deleted from favorites!');
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var newsModel = await NewsRepository().getNews();
      if (newsModel.articles!.isNotEmpty) {
        newsList.assignAll(newsModel.articles!);
      } else {
        Get.snackbar('No News', 'No articles found');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load news');
    } finally {
      isLoading(false);
    }
  }

  void fetchFavsFromApi() async {
    if (favsList.isEmpty) {
      Get.snackbar('No Favorites', 'No articles found in favorites');
      return;
    }

    List<Articles> favArticles = [];
    for (var fav in favsList) {
      var favNews = await NewsRepository().getNewsByTitle(fav.title!);
      if (favNews.articles!.isNotEmpty) {
        favArticles.addAll(favNews.articles!);
      }
    }
    newsList.assignAll(favArticles);
  }
}
