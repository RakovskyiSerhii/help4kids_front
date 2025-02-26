import 'package:flutter/material.dart';

class SizedWidget extends StatelessWidget {
  const SizedWidget({super.key, required this.builder});

  final Widget Function(BuildContext context, SizeType type) builder;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return builder(context, SizeType.mobile);
    } else if (width < 1024) {
      return builder(context, SizeType.tablet);
    } else {
      return builder(context, SizeType.pc);
    }
  }
}

enum SizeType {
  mobile,
  tablet,
  pc;
}
