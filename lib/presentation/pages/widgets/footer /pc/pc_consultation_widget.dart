part of '../footer_widget.dart';

class PcConsultationWidget extends StatelessWidget {
  const PcConsultationWidget({super.key, required this.consultations});

  final List<Consultation> consultations;

  @override
  Widget build(BuildContext context) {
    var list = consultations.take(3).toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
      child: Column(
        children: [
          Text(
            'Запис на онлайн консультацію',
            style: context.theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Row(
            children: list
                .map((consultation) => ConsultationItemWidget(
                      consultation: consultation,
                      useExpanded: true,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
