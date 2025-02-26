part of '../footer_widget.dart';

class PcConsultationWidget extends StatelessWidget {
  const PcConsultationWidget({super.key, required this.consultations});

  final List<Consultation> consultations;

  @override
  Widget build(BuildContext context) {
    var list = consultations.take(3).toList();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
      child: Column(
        children: [
          Text(
            'Запис на онлайн консультацію',
            style: context.theme.textTheme.titleLarge,
          ),
          Row(
            children: list
                .asMap()
                .map(
                  (key, value) => MapEntry(
                      key,
                      Padding(
                        padding: EdgeInsets.only(top: key == 1 ? 0 : 8),
                        child: ConsultationItemWidget(consultation: value),
                      )),
                )
                .values
                .toList(),
          ),
        ],
      ),
    );
  }
}
