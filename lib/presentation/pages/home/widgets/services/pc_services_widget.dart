part of 'services_widget.dart';

class PcServicesWidget extends StatelessWidget {
  const PcServicesWidget({super.key, required this.list});

  final List<ServiceCategory> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ServiceItemWidget(service: list[index]);
        },
      ),
    );
  }
}
