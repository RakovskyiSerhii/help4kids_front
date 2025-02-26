import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/data/model/staff.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/staff/widgets/staff_image_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

class StaffRowItemWidget extends StatelessWidget {
  const StaffRowItemWidget({
    super.key,
    required this.staff,
    required this.index,
  });

  final Staff staff;
  final int index;

  @override
  Widget build(BuildContext context) {

    final textWidget = SizedWidget(builder: (context, type) {
      final double kTitle;
      final double kDescription;

      switch (type) {
        case SizeType.mobile:
          kTitle = 0.05;
          kDescription = 0.03;
          break;
        case SizeType.tablet:
          kTitle = 0.04;
          kDescription = 0.025;
          break;
        case SizeType.pc:
          kTitle = 0.03;
          kDescription = 0.015;
          break;
      }
      final text = Text(
        staff.content ?? '',
        style: context.theme.textTheme.bodyMedium?.copyWith(
          fontSize: MediaQuery.of(context).size.width * kDescription,
        ),
      );
      final name = Text(
        staff.name ?? '',
        style: context.theme.textTheme.titleMedium?.copyWith(
          fontSize: MediaQuery.of(context).size.width * kTitle,
        ),
      );

      return switch (type) {
        SizeType.mobile => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            name,
            const SizedBox(height: 8),
            text,
          ],
        ),
        SizeType.pc || SizeType.tablet => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            name,
            const SizedBox(height: 8),
            text,
          ],
        ),
      };
    },);
    if (index % 2 == 1) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: textWidget),
          const SizedBox(width: 16),
          StaffImageWidget(
            url: staff.photoUrl == null || staff.photoUrl!.isEmpty
                ? 'http://www.help4kids.com.ua/wp-content/uploads/2022/08/%D1%80%D0%B0%D0%BA%D0%BE%D0%B2%D1%81%D1%8C%D0%BA%D0%B0.jpg'
                : staff.photoUrl!,
            placing: StaffImagePlacing.right,
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StaffImageWidget(
            url: staff.photoUrl == null || staff.photoUrl!.isEmpty
                ? 'http://www.help4kids.com.ua/wp-content/uploads/2022/08/%D1%80%D0%B0%D0%BA%D0%BE%D0%B2%D1%81%D1%8C%D0%BA%D0%B0.jpg'
                : staff.photoUrl!,
            placing: StaffImagePlacing.left,
          ),
          const SizedBox(width: 16),
          Expanded(child: textWidget),
        ],
      );
    }
  }
}
