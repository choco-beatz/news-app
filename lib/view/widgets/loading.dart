
import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/constant/colors.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: red,
    ));
  }
}
