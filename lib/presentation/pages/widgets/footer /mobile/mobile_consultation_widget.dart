part of '../footer_widget.dart';

class MobileConsultationWidget extends StatelessWidget {
  const MobileConsultationWidget({super.key, required this.consultations});

  final List<Consultation> consultations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
