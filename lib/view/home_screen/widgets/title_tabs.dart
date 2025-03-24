import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/constant/colors.dart';
import 'package:kalpas_machine_test/view/widgets/tabs.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TitleTabs extends StatelessWidget {
  const TitleTabs({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        tabAlignment: TabAlignment.center,
        labelColor: black,
        unselectedLabelColor: black,
        dividerColor: white,
        indicatorColor: white,
        indicator: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: lightGrey),
        tabs: [
          Tabs(
            width: width,
            icons: LucideIcons.list,
            title: 'News',
          ),
          Tabs(
            width: width,
            icons: Icons.favorite,
            title: 'Favs',
            isRed: true,
          ),
        ]);
  }
}
