import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalpas_machine_test/constant/colors.dart';

class Text28 extends StatelessWidget {
  const Text28({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
    );
  }
}

class Text11 extends StatelessWidget {
  const Text11({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
    );
  }
}

class Text12 extends StatelessWidget {
  const Text12(
      {super.key,
      required this.title,
      this.isBlack = false,
      this.isBold = false});

  final String title;
  final bool isBlack;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 12,
          color: isBlack ? black : grey,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w600),
    );
  }
}

class Text14 extends StatelessWidget {
  const Text14({
    super.key,
    required this.title,
    this.isBold = false,
    this.isMultiLine = false
  });

  final String title;
  final bool isBold;
  final bool isMultiLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: isMultiLine ? null : 2,
      overflow: TextOverflow.clip,
      title,
      style: TextStyle(
          fontSize: 14, fontWeight: isBold ? FontWeight.w700 : FontWeight.w400),
    );
  }
}

String formatPublishedDate(String dateString) {
  try {
    DateTime dateTime = DateTime.parse(dateString);

    String formattedDate =
        DateFormat("  E, dd MMM yyyy HH:mm 'GMT'").format(dateTime.toUtc());
    return formattedDate;
  } catch (e) {
    return dateString;
  }
}
