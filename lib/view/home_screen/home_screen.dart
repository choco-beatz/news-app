import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:kalpas_machine_test/controller/controller.dart';
import 'package:kalpas_machine_test/view/home_screen/widgets/favs_tab_view.dart';
import 'package:kalpas_machine_test/view/home_screen/widgets/news_tab_view.dart';
import 'package:kalpas_machine_test/view/home_screen/widgets/title_tabs.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Controller newsController = Get.put(Controller());
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TitleTabs(width: width),
                Expanded(
                    child: TabBarView(
                  children: [
                    News(newsController: newsController),
                    Favs(newsController: newsController)
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
