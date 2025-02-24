import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final double thickness;
  final Color? color;

  const ProgressWidget({
    super.key,
    this.thickness = 4.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: thickness,
        valueColor: color == null ? null : AlwaysStoppedAnimation(color),
      ),
    );
  }
}
