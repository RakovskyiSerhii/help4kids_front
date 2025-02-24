import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/presentation/pages/widgets/progress_widget.dart';

class ProgressButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool progress;
  final bool enabled;

  const ProgressButton({
    super.key,
    this.onPressed,
    required this.text,
    this.progress = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled && !progress ? onPressed : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 24),
          Text(text),
          const SizedBox(width: 12),
          SizedBox(
            width: 12,
            height: 12,
            child: progress ? const _Progress() : null,
          ),
        ],
      ),
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress();

  @override
  Widget build(BuildContext context) {
    return ProgressWidget(
      thickness: 1.5,
      color: context.theme.colorScheme.onPrimary,
    );
  }
}
