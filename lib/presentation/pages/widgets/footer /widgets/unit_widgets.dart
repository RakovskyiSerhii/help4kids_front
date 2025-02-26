import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

class UnitRowWidget extends StatelessWidget {
  const UnitRowWidget({
    super.key,
    required this.icon,
    this.title,
    required this.subtitle,
  });

  final Widget icon;
  final String? title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedWidget(builder: (context, type) {
      final double kTitle;
      final double kDescription;

      switch (type) {
        case SizeType.mobile:
          kTitle = 0.05;
          kDescription = 0.03;
          break;
        case SizeType.tablet:
          kTitle = 0.02;
          kDescription = 0.015;
          break;
        case SizeType.pc:
          kTitle = 0.02;
          kDescription = 0.012;
          break;
      }
      return Row(
        crossAxisAlignment: title != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: icon,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: context.theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: MediaQuery.of(context).size.width * kTitle),
                  ),
                Text(
                  subtitle,
                  style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: MediaQuery.of(context).size.width * kDescription),
                ),
              ],
            ),
          ),
        ],
      );
    },);
  }
}
