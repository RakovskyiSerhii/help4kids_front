import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/data/model/staff.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/staff/widgets/staff_image_widget.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/staff/widgets/staff_row_item_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

part 'layouts/mobile_staff_widget.dart';

part 'layouts/pc_staff_widget.dart';

part 'layouts/tablet_staff_widget.dart';

class StaffWidget extends StatelessWidget {
  const StaffWidget({super.key, required this.featuredStaff});

  final List<Staff> featuredStaff;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return SizedWidget(
          builder: (context, type) {
            return switch (type) {
              SizeType.mobile => MobileStaffWidget(staff: featuredStaff[index]),
              SizeType.pc => PcStaffWidget(
                  staff: featuredStaff[index],
                  index: index,
                ),
              SizeType.tablet => TabletStaffWidget(
                  staff: featuredStaff[index],
                  index: index,
                ),
            };
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 36),
      itemCount: featuredStaff.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
