import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/data/model/consultation.dart';

class ConsultationItemWidget extends StatelessWidget {
  const ConsultationItemWidget({super.key, required this.consultation});

  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            consultation.title,
            style: context.theme.textTheme.titleMedium,
          ),
          Text(
            consultation.shortDescription,
            style: context.theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
