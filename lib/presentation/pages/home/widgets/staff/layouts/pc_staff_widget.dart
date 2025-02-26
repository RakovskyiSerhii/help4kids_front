part of '../staff_widget.dart';

class PcStaffWidget extends StatelessWidget {
  const PcStaffWidget({super.key, required this.staff, required this.index});

  final Staff staff;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1),
      child: StaffRowItemWidget(staff: staff, index: index),
    );
  }
}
