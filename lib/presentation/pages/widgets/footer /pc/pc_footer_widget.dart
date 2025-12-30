part of '../footer_widget.dart';

class PcFooterWidget extends StatelessWidget {
  const PcFooterWidget({
    super.key,
    required this.socialContacts,
    required this.financeInfo,
  });

  final List<SocialContact> socialContacts;
  final FinanceInfo financeInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
      ),
      child: Row(
        children: [
          Expanded(child: SocialContactWidget(socialContacts: socialContacts)),
          Expanded(child: FinanceInfoWidget(financeInfo: financeInfo)),
        ],
      ),
    );
  }
}
