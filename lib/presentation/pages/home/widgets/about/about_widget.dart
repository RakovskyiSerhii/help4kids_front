import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/theme/app_colors.dart';
import 'package:help4kids_front/generated/assets.gen.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

part 'mobile_about_widget.dart';
part 'pc_about_widget.dart';
part 'tablet_about_widget.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedWidget(builder: (context, type) {
      return switch(type) {
        SizeType.mobile => MobileAboutWidget(),
        SizeType.tablet => TabletAboutWidget(),
        SizeType.pc => PcAboutWidget(),
      };
    },);
  }
}

class DescriptionImage extends StatelessWidget {
  const DescriptionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(MediaQuery.of(context).size.width * .12),
        ),
        border: Border(
            left: BorderSide(
              width: 8,
          color: AppColors.lightPrimaryColor,
        )),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        image: DecorationImage(image: AssetImage(Assets.images.frontImageDescr.path), fit: BoxFit.cover),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedWidget(builder: (context, type) {
      final double kTitle;
      final double kDescription;

      switch (type) {
        case SizeType.mobile:
          kTitle = 0.07;
          kDescription = 0.04;
          break;
        case SizeType.tablet:
          kTitle = 0.035;
          kDescription = 0.023;
          break;
        case SizeType.pc:
          kTitle = 0.025;
          kDescription = 0.015;
          break;
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "МЕДИЧНИЙ ЦЕНТР “HELP kids+”",
            style: context.theme.textTheme.titleLarge?.copyWith(fontSize: MediaQuery.of(context).size.width * kTitle),
          ),
          Text(
            context.localizations.home_description,
            style: context.theme.textTheme.bodyMedium?.copyWith(fontSize: MediaQuery.of(context).size.width * kDescription),
          )
        ],
      );
    },);
  }
}
