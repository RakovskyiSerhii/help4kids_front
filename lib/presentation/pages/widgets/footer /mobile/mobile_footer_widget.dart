part of '../footer_widget.dart';

class MobileFooterWidget extends StatelessWidget {
  const MobileFooterWidget(
      {super.key, required this.socialContacts, this.financeInfo});

  final List<SocialContact> socialContacts;
  final FinanceInfo? financeInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SocialContactWidget(socialContacts: socialContacts),
          if (financeInfo != null) ...[
            const SizedBox(height: 50),
            FinanceInfoWidget(financeInfo: financeInfo!),
          ],
        ],
      ),
    );
  }
}
