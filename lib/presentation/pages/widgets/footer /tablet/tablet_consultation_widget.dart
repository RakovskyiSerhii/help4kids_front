part of '../footer_widget.dart';

class TabletConsultationWidget extends StatelessWidget {
  const TabletConsultationWidget({super.key, required this.consultations});

  final List<Consultation> consultations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: consultations.map((consultation) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ConsultationItemWidget(consultation: consultation),
          );
        }).toList(),
      ),
    );
  }
}
