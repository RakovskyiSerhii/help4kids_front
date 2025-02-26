part of 'services_widget.dart';

class MobileServicesWidget extends StatelessWidget {
  const MobileServicesWidget({super.key, required this.list});

  final List<ServiceCategory> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ServiceItemWidget(service: list[index]);
        },
      ),
    );
  }
}
