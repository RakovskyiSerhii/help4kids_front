import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/routing/screens.dart';
import 'package:help4kids_front/core/theme/app_colors.dart';
import 'package:help4kids_front/data/model/service.dart';
import 'package:help4kids_front/data/model/service_category.dart';
import 'package:help4kids_front/generated/assets.gen.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';
import 'package:help4kids_front/presentation/widgets/service_category_icon.dart';

part 'mobile_services_widget.dart';

part 'pc_services_widget.dart';

part 'tablet_services_widget.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key, required this.list});

  final List<ServiceCategory> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Assets.bg.bgWaveTop.svg(
              width: double.infinity,
              height: 50,
              fit: BoxFit.fill,
              colorFilter:
                   ColorFilter.mode(context.theme.primaryColor.withOpacity(.2), BlendMode.srcIn),
            ),
          ),
          Container(
            color: context.theme.primaryColor.withOpacity(.2),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedWidget(
              builder: (context, type) {
                return switch (type) {
                  SizeType.mobile => MobileServicesWidget(list: list),
                  SizeType.tablet => TabletServicesWidget(list: list),
                  SizeType.pc => PcServicesWidget(list: list),
                };
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Assets.bg.bgWaveBottom.svg(
              width: double.infinity,
              height: 50,
              fit: BoxFit.fill,
              colorFilter:
              ColorFilter.mode(context.theme.primaryColor.withOpacity(.2), BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({super.key, required this.service});

  final ServiceCategory service;

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      builder: (context, type) {
        final double kTitle;
        final double kDescription;

        switch (type) {
          case SizeType.mobile:
            kTitle = 0.05;
            kDescription = 0.035;
            break;
          case SizeType.tablet:
            kTitle = 0.018;
            kDescription = 0.015;
            break;
          case SizeType.pc:
            kTitle = 0.018;
            kDescription = 0.015;
            break;
        }
        return ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 350, minHeight: 200),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                // Navigate to the services (pricing) page and pass selected category.
                context.goNamed(
                  Screen.services,
                  queryParameters: {'categoryId': service.id},
                );
              },
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon at the top
                    ServiceCategoryIcon(
                      iconUrl: service.iconUrl,
                      width: 48,
                      height: 48,
                      color: context.theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      service.name,
                      textAlign: TextAlign.center,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width * kTitle,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (service.description?.isNotEmpty == true)
                      Text(
                        service.description!,
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontSize: MediaQuery.of(context).size.width *
                                  kDescription,
                            ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
