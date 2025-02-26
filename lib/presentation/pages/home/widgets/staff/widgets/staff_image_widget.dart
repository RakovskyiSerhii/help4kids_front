import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

enum StaffImagePlacing { left, right }

class StaffImageWidget extends StatelessWidget {
  const StaffImageWidget({
    super.key,
    required this.url,
    this.placing,
  });

  final String url;
  final StaffImagePlacing? placing;

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      builder: (context, type) {
        return switch (type) {
          SizeType.mobile => Container(
            constraints: BoxConstraints(
              minHeight: 400,
              minWidth: 200,
              maxWidth: max(200, MediaQuery.of(context).size.width * 0.95),
            ),
              decoration: BoxDecoration(
                border: Border.all(color: context.theme.colorScheme.secondary, width: 5),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(url),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: context.theme.colorScheme.primary,
                    offset: Offset(0, 0),
                    blurRadius:5,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
          SizeType.pc || SizeType.tablet => Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
                minWidth: 200,
                maxWidth: max(200, MediaQuery.of(context).size.width * 0.15),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(url),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: context.theme.colorScheme.secondary, width: 5),
                borderRadius: switch (placing!) {
                  StaffImagePlacing.left => BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width * 0.05),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width * 0.05)),
                  StaffImagePlacing.right => BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width * 0.05),
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.width * 0.05)),
                },
                boxShadow: [
                  BoxShadow(
                    color: context.theme.colorScheme.primary,
                    offset: Offset(0, 0),
                    blurRadius:5,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
        };
      },
    );
  }
}
