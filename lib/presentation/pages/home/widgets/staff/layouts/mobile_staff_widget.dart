part of '../staff_widget.dart';

class MobileStaffWidget extends StatelessWidget {
  const MobileStaffWidget({super.key, required this.staff});

  final Staff staff;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StaffImageWidget(
            url: staff.photoUrl == null || staff.photoUrl!.isEmpty
                ? 'http://www.help4kids.com.ua/wp-content/uploads/2022/08/%D1%80%D0%B0%D0%BA%D0%BE%D0%B2%D1%81%D1%8C%D0%BA%D0%B0.jpg'
                : staff.photoUrl!,
            placing: null,
          ),
          const SizedBox(height: 24),
          Text(
            staff.name ?? '',
            style: context.theme.textTheme.titleLarge?.copyWith(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
          const SizedBox(height: 8),
          Text(
            staff.content ?? '',
            style: context.theme.textTheme.bodyMedium?.copyWith(fontSize: MediaQuery.of(context).size.width * 0.04),
          ),
        ],
      ),
    );
  }
}
