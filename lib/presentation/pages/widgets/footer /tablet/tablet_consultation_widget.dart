part of '../footer_widget.dart';

class TabletConsultationWidget extends StatelessWidget {
  const TabletConsultationWidget({super.key, required this.consultations});

  final List<Consultation> consultations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .05),
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
