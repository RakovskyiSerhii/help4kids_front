part of '../staff_widget.dart';

class TabletStaffWidget extends StatelessWidget {
  const TabletStaffWidget(
      {super.key, required this.staff, required this.index});

  final Staff staff;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .05),
      child: StaffRowItemWidget(staff: staff, index: index),
    );
  }
}
