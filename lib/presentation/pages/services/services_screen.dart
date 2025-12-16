import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/data/model/service.dart';
import 'package:help4kids_front/data/model/service_category.dart';
import 'package:help4kids_front/generated/assets.gen.dart';
import 'package:help4kids_front/presentation/pages/services/services_cubit.dart';
import 'package:help4kids_front/presentation/pages/services/services_state.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/footer_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/header/header_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key, this.initialCategoryId});

  final String? initialCategoryId;

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final _scrollController = ScrollController();
  final Map<String, GlobalKey> _categoryKeys = {};
  bool _didScrollToInitialCategory = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _maybeScrollToInitialCategory(List<ServiceCategory> categories) {
    if (_didScrollToInitialCategory || widget.initialCategoryId == null) {
      return;
    }
    final key = _categoryKeys[widget.initialCategoryId];
    if (key?.currentContext != null) {
      _didScrollToInitialCategory = true;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<ServicesCubit>()..load(),
        child: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state.loadResult?.isProgress == true) {
              return Center(child: CircularProgressIndicator());
            }
            final categories = state.categories ?? [];
            final services = state.services ?? <Service>[];
            // Once categories are available, try to scroll to the initial category.
            _maybeScrollToInitialCategory(categories);
            return Column(
              children: [
                HeaderWidget(serviceCategories: categories),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        _buildTitle(context),
                        const SizedBox(height: 50),
                        _buildList(context, categories, services),
                        FooterWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    List<ServiceCategory> categories,
    List<Service> services,
  ) {
    final horizontalPadding =
        MediaQuery.of(context).size.width * 0.08; // ~8% of screen width

    return Container(
      decoration: BoxDecoration(
        color: context.theme.primaryColor.withOpacity(.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final category = categories[index];
          final key = _categoryKeys.putIfAbsent(
            category.id,
            () => GlobalKey(),
          );
          final categorizedServices = services
              .where((element) => element.categoryId == category.id)
              .toList();
          return Container(
            key: key,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                ListView.separated(
                  itemBuilder: (context, serviceIndex) {
                    final service = categorizedServices[serviceIndex];
                    return ServicePriceRow(service: service);
                  },
                  separatorBuilder: (context, _) => const Divider(),
                  itemCount: categorizedServices.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: double.infinity,
          height: 50,
          child: Assets.bg.bgWaveBottom.svg(
            width: double.infinity,
            height: 50,
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              context.theme.primaryColor.withOpacity(.2),
              BlendMode.srcIn,
            ),
          ),
        ),
        itemCount: categories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return SizedWidget(
      builder: (context, type) {
        final double padding;
        switch (type) {
          case SizeType.mobile:
            padding = 16;
            break;
          case SizeType.tablet:
            padding = MediaQuery.of(context).size.width * 0.05;
            break;
          case SizeType.pc:
            padding = MediaQuery.of(context).size.width * 0.1;
            break;
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36),
                Text(
                  'Наші послуги',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Ціни сформовані станом на 27.02.2025',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatPrice(Service service) {
    final map = service.price;
    final num? base = map['price'] as num?;
    final String? custom = map['customPriceString'] as String?;

    if (base != null && base > 0) {
      // Basic formatting, adjust currency/locale as needed.
      return '${base.toStringAsFixed(0)} грн';
    }
    if (custom != null && custom.isNotEmpty) {
      return custom;
    }
    return '';
  }
}

class ServicePriceRow extends StatelessWidget {
  const ServicePriceRow({super.key, required this.service});

  final Service service;

  @override
  Widget build(BuildContext context) {
    final sizeType = context.sizeType;
    final priceText = context
        .findAncestorStateOfType<_ServicesScreenState>()!
        ._formatPrice(service);

    final textTheme = Theme.of(context).textTheme;

    // If there's no visible price, just render the title with padding.
    if (priceText.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          service.title,
          style: textTheme.bodyLarge,
        ),
      );
    }

    // Mobile: stacked layout with extra padding, bigger bold price.
    if (sizeType == SizeType.mobile) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.title,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              priceText,
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    }

    // Tablet & PC: title left (up to ~60% width), price right, padded; price bigger & bold.
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: Text(
              service.title,
              style: textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.loose,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                priceText,
                textAlign: TextAlign.end,
                style: textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
