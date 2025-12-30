part of '../footer_widget.dart';

class TabletFooterWidget extends StatelessWidget {
  const TabletFooterWidget({
    super.key,
    required this.socialContacts,
    this.financeInfo,
  });

  final List<SocialContact> socialContacts;
  final FinanceInfo? financeInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .05),
      child: Row(
        children: [
          Expanded(
            child: SocialContactWidget(socialContacts: socialContacts),
          ),
          if (financeInfo != null) ...[
            Spacer(),
            Expanded(
              child: FinanceInfoWidget(financeInfo: financeInfo!),
            ),
          ],
        ],
      ),
    );
  }
}
