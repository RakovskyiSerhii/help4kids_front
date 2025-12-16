import 'package:flutter/material.dart';

/// Central place to tweak app-wide responsive breakpoints.
class Breakpoints {
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1024;
}

class SizedWidget extends StatelessWidget {
  const SizedWidget({super.key, required this.builder});

  final Widget Function(BuildContext context, SizeType type) builder;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final type = width < Breakpoints.mobileMaxWidth
        ? SizeType.mobile
        : (width < Breakpoints.tabletMaxWidth ? SizeType.tablet : SizeType.pc);

    return builder(context, type);
  }
}

enum SizeType {
  mobile,
  tablet,
  pc;
}

extension BuildContextSizeTypeX on BuildContext {
  SizeType get sizeType {
    final width = MediaQuery.of(this).size.width;
    if (width < Breakpoints.mobileMaxWidth) {
      return SizeType.mobile;
    }
    if (width < Breakpoints.tabletMaxWidth) {
      return SizeType.tablet;
    }
    return SizeType.pc;
  }
}
