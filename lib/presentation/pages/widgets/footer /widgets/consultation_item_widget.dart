import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/routing/screens.dart';
import 'package:help4kids_front/data/model/consultation.dart';

class ConsultationItemWidget extends StatelessWidget {
  const ConsultationItemWidget({
    super.key,
    required this.consultation,
    this.useExpanded = false,
  });

  final Consultation consultation;
  final bool useExpanded; // For PC layout where we need Expanded

  @override
  Widget build(BuildContext context) {
    final container = Container(
      height: 80, // Fixed height for uniform sizes
      margin: useExpanded ? const EdgeInsets.symmetric(horizontal: 8) : EdgeInsets.zero,
      padding: const EdgeInsets.all(16),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.goNamed(
              Screen.consultationDetail,
              queryParameters: {'id': consultation.id},
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Text(
              consultation.title,
              style: context.theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );

    if (useExpanded) {
      return Expanded(child: container);
    }
    return container;
  }
}
