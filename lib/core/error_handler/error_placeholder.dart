import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';

class ErrorPlaceholder extends StatelessWidget {
  final String text;
  final String? retryButtonText;
  final VoidCallback? onRetry;

  const ErrorPlaceholder({
    super.key,
    required this.text,
    this.retryButtonText,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(text),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              TextButton(
                onPressed: onRetry,
                child: Text(
                  retryButtonText ?? 'Retry',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
