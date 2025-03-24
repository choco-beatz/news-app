import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/constant/colors.dart';
import 'package:kalpas_machine_test/constant/text.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    this.isRed = false,
    required this.width,
    required this.icons,
    required this.title,
  });

  final double width;
  final IconData icons;
  final String title;
  final bool isRed;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: SizedBox(
        width: width * 0.38,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icons,
              color: isRed ? red : black,
              size: 32,
            ),
            Text28(title: title),
          ],
        ),
      ),
    );
  }
}
