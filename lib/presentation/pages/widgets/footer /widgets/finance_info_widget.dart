import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/data/model/finance_info.dart';

class FinanceInfoWidget extends StatelessWidget {
  const FinanceInfoWidget({super.key, required this.financeInfo});

  final FinanceInfo financeInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(financeInfo.name, style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.white)),
        const SizedBox(height: 2),
        Text(
          'ІПН: ${financeInfo.tNumber}',
          style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 2),
        Text(
          'Юридична адреса: ${financeInfo.officialAddress}',
          style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 2),
        Text(
          'Фактична адреса: ${financeInfo.actualAddress}',
          style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
