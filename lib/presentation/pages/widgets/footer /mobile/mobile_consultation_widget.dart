part of '../footer_widget.dart';

class MobileConsultationWidget extends StatelessWidget {
  const MobileConsultationWidget({super.key, required this.consultations});

  final List<Consultation> consultations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ConsultationItemWidget(consultation: consultations[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: consultations.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
